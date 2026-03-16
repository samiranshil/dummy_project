import '../core/api_client.dart';
import '../models/post.dart';

class PostRepository {

  final ApiClient apiClient;

  PostRepository(this.apiClient);

  Future<List<Post>> fetchPosts() async {

    final data = await apiClient.getPosts();

    return data.map((e) => Post.fromJson(e)).toList();

  }
}