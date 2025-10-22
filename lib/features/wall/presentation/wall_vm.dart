import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';
import 'package:couch_social_app/features/wall/domain/entities/app_post.dart';
import 'package:couch_social_app/features/wall/domain/repo_contracts/friends_repository.dart';
import 'package:couch_social_app/features/wall/domain/repo_contracts/wall_repository.dart';
import 'package:flutter/material.dart';

class WallVM extends ChangeNotifier {
  final WallRepository wallRepository;
  final FriendsRepository friendsRepository;
  final String loggedUserId;

  bool _isLoading = false;
  String? _error;
  List<AppPost> _posts = [];
  final List<AppUser> _friends = <AppUser>[];

  List<AppUser> get friends => _friends;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<AppPost> get posts => _posts;

  WallVM({
    required this.wallRepository,
    required this.friendsRepository,
    required this.loggedUserId,
  });

  init() async {
    await loadPosts();
    await loadFriends();
    await updatePostsWithAuthor();
  }

  Future<void> loadFriends() async {
    // Loading friends is not a blocking operation when loading posts in wall screen
    _isLoading = false;
    _error = null;
    notifyListeners();

    final friendsResult = await friendsRepository.getFriends(loggedUserId);
    switch (friendsResult) {
      case Ok(value: final friends):
        _friends.addAll(friends);
      case Error(error: final error):
        _error = error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updatePostsWithAuthor() async {
    // Update all posts with their author information
    _posts = _posts.map((post) {
      // Find the author in the friends list
      final author = _friends.firstWhere(
        (user) => user.id == post.authorId,
        orElse: () => throw Exception(
          'Author not found in friends list for post ${post.id}',
        ),
      );

      // Return updated post with author information
      return AppPost(
        id: post.id,
        content: post.content,
        authorId: post.authorId,
        author: author,
        createdAt: post.createdAt,
      );
    }).toList();

    notifyListeners();
  }

  Future<void> loadPosts() async {
    _isLoading = true;
    // If loadPosts() is called multiple times, make sure the error is cleared
    _error = null;
    notifyListeners();

    final postsResult = await wallRepository.getPosts();
    switch (postsResult) {
      case Ok(value: final posts):
        _posts = posts;
      case Error(error: final error):
        _error = error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
