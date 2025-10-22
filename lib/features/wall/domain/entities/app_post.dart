import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';

class AppPost {
  final String id;
  final String content;
  final String authorId;
  AppUser? author;
  final DateTime createdAt;

  AppPost({
    required this.id,
    required this.content,
    required this.authorId,
    this.author,
    required this.createdAt,
  });
}
