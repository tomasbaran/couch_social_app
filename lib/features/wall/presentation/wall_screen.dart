import 'package:couch_social_app/core/data/fake_data.dart';
import 'package:couch_social_app/features/wall/data/friends_repository_impl.dart';
import 'package:couch_social_app/features/wall/data/wall_repository_impl.dart';
import 'package:couch_social_app/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'wall_vm.dart';
import 'post_screen.dart';

class WallScreen extends StatelessWidget {
  const WallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final fakeData = FakeData();
        return WallVM(
          wallRepository: WallRepositoryImpl(fakeData: fakeData),
          friendsRepository: FriendsRepositoryImpl(fakeData: fakeData),
          loggedUserId: FakeData.loggedUserId,
        )..init();
      },
      child: const _WallScreenView(),
    );
  }
}

class _WallScreenView extends StatelessWidget {
  const _WallScreenView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wall'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Consumer<WallVM>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading wall',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    viewModel.error!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.loadPosts(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final posts = viewModel.posts;
          if (posts.isEmpty) {
            return const Center(child: Text('...'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                post.author?.imageUrl.isNotEmpty == true
                                ? NetworkImage(post.author!.imageUrl)
                                : null,
                            child: post.author?.imageUrl.isEmpty != false
                                ? const Icon(Icons.person)
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${post.author?.firstName} ${post.author?.lastName}',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '@${post.author?.id}',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildPostContent(context, post),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {
                              // Handle like action
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.comment_outlined),
                            onPressed: () {
                              // Handle comment action
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share_outlined),
                            onPressed: () {
                              // Handle share action
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPostContent(BuildContext context, post) {
    const maxLength = 120;
    final isLongPost = post.content.length > maxLength;
    final displayText = isLongPost
        ? '${post.content.substring(0, maxLength)}...'
        : post.content;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(displayText, style: Theme.of(context).textTheme.bodyLarge),
        if (isLongPost) ...[
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PostScreen(post: post)),
              );
            },
            child: const Text('Read more'),
          ),
        ],
      ],
    );
  }
}
