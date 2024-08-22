import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subspace_assig/constants/values.dart';
import 'package:subspace_assig/models/blog.dart';

class ApiService {
  

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse(values.baseUrl), headers: {
      'x-hasura-admin-secret': values.adminSecret,
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


