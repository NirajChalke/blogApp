import 'package:flutter/material.dart';
import 'package:subspace_assig/Blog/blog_detail_screen.dart';
import 'package:subspace_assig/Blog/widget/blog_list_view_widget.dart';
import 'package:subspace_assig/constants/colors.dart';
import 'package:subspace_assig/models/blog.dart';
import 'package:subspace_assig/services/api_service.dart';

class BlogListScreen extends StatefulWidget {
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  late Future<List<Blog>> _futureBlogs;

  @override
  void initState() {
    super.initState();
    _futureBlogs = ApiService().fetchBlogs().then((blogs) {
      print('Fetched blogs: $blogs');
      return blogs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
      title: Container(
        height: 100,
        width: 100,
        child: Image.asset('assets/images/logo.png'),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite),color: AppColors.textColor,)
      ],
      ),
      body: FutureBuilder(
        future: _futureBlogs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final blogs = snapshot.data!;
            print('Blogs: $blogs');
            return ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final blog = blogs[index];
                print('Blog $index: ${blog.title}');
                return BlogListItem(blog: blog);
              },
            );
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
