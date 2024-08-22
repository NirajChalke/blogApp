import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subspace_assig/models/blog.dart';

class ApiService {
  static const String _baseUrl =
      'https://intent-kit-16.hasura.app/api/rest/blogs';
  static const String _adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse(_baseUrl), headers: {
      'x-hasura-admin-secret': _adminSecret,
    });

    if (response.statusCode == 200) {
      // Parse the response data into a list of Blog objects
      final jsonData = jsonDecode(response.body);
      final blogsJson = jsonData['blogs']; // access the "blogs" key
      final blogs = (blogsJson as List).map<Blog>((jsonBlog) => Blog.fromJson(jsonBlog)).toList();
      return blogs;
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}


