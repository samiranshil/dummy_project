import 'package:flutter/material.dart';
import '../core/api_client.dart';
import '../repositories/post_repository.dart';
import '../models/post.dart';
import 'post_detail_screen.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {

  late Future<List<Post>> posts;

  final repository = PostRepository(ApiClient());

  @override
  void initState() {
    super.initState();
    posts = repository.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),

      body: FutureBuilder<List<Post>>(
        future: posts,

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading posts"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,

            itemBuilder: (context, index) {

              final post = data[index];

              return ListTile(
                title: Text(post.title),

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailScreen(post: post),
                    ),
                  );

                },
              );
            },
          );
        },
      ),
    );
  }
}