import 'package:couch_social_app/features/wall/domain/entities/app_post.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final AppPost post;

  const PostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: post.author?.imageUrl.isNotEmpty == true
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
                          Text(
                            _formatDate(post.createdAt),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  post.content,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
                const SizedBox(height: 16),
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
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
