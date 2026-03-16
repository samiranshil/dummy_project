import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:dummy_project/repositories/post_repository.dart';
import 'package:dummy_project/models/post.dart';

import '../mocks/mock_classes.mocks.dart';

void main() {

  late MockApiClient mockApiClient;
  late PostRepository repository;

  setUp(() {
    mockApiClient = MockApiClient();
    repository = PostRepository(mockApiClient);
  });

  test("should return list of posts", () async {

    when(mockApiClient.getPosts()).thenAnswer(
          (_) async => [
        {
          "id": 1,
          "title": "Test title",
          "body": "Test body"
        }
      ],
    );

    final result = await repository.fetchPosts();

    expect(result, isA<List<Post>>());
    expect(result.first.title, "Test title");

    verify(mockApiClient.getPosts()).called(1);

  });

}