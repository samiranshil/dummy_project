import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {

  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> getPosts() async {

    final response = await http.get(Uri.parse("$baseUrl/posts"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Error");
    }

  }
}