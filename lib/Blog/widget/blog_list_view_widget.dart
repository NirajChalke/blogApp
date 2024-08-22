import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_assig/Blog/bloc/blog_bloc.dart';
import 'package:subspace_assig/Blog/bloc/blog_events.dart';
import 'package:subspace_assig/Blog/bloc/blog_state.dart';
import 'package:subspace_assig/Blog/screens/blog_detail_screen.dart';
import 'package:subspace_assig/Utils/ReusableText.dart';
import 'package:subspace_assig/constants/colors.dart';
import 'package:subspace_assig/models/blog.dart';

class BlogListItem extends StatefulWidget {
  final Blog blog;

  const BlogListItem({super.key,required this.blog});

  @override
  State<BlogListItem> createState() => _BlogListItemState();
}

class _BlogListItemState extends State<BlogListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<AppBlocs, AppState>(
        builder: (context, state) {
          return SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.blog.image!),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (state.isliked != null ) {
                                context.read<AppBlocs>().add(
                                    TriggerlikeEvent(isliked: !state.isliked!));
                                    widget.blog.isliked=state.isliked;
                                    print(widget.blog.isliked);
                              } else {
                                // Handle the case where state.isliked is null
                                print('state.isliked is null');
                              }
                            },
                            child: widget.blog.isliked != null && widget.blog.isliked!
                                ? const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                      Icons.favorite,
                                      color: AppColors.textColor,
                                    ),
                                )
                                : const SizedBox(
                                  height: 30,width: 30,
                                  child: Icon(
                                      Icons.favorite_border,
                                      color: AppColors.textColor,
                                    ),
                                ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    const SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 200,
                              child: reusableText(context, widget.blog.title!,
                                  textColor: AppColors.textColor, size: 18)),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      BlogDetailScreen(blog: widget.blog)));
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
