import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:subspace_assig/Blog/blog_detail_screen.dart';
import 'package:subspace_assig/Utils/ReusableText.dart';
import 'package:subspace_assig/constants/colors.dart';
import 'package:subspace_assig/models/blog.dart';

class BlogListItem extends StatelessWidget {
  final Blog blog;

  BlogListItem({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        width: 200,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(blog.image!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(width: 200,child: reusableText(context, blog.title!,textColor: AppColors.textColor,size: 18)),
                  IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlogDetailScreen(blog:blog)));
                  }, icon: const Icon(Icons.arrow_forward_ios),color: AppColors.textColor,)
                 ],),
               )
              ],
            ),
          ],
        ),
      ),
    );
  }
}