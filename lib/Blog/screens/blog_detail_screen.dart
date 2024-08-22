import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_assig/Blog/bloc/blog_bloc.dart';
import 'package:subspace_assig/Blog/bloc/blog_events.dart';
import 'package:subspace_assig/Blog/bloc/blog_state.dart';
import 'package:subspace_assig/Utils/ReusableText.dart';
import 'package:subspace_assig/constants/colors.dart';
import 'package:subspace_assig/constants/values.dart';
import 'package:subspace_assig/models/blog.dart';

class BlogDetailScreen extends StatefulWidget {
  final Blog blog;
  const BlogDetailScreen({super.key, required this.blog});

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: BlocBuilder<AppBlocs, AppState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.blog.image!),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: reusableText(context, widget.blog.title!,
                        textColor: AppColors.textColor,
                        size: 24,
                        fontWeight: FontWeight.bold),
                  ),
                 
                  SizedBox(height: 16),
                  state.showMore != null && state.showMore!
                      ? reusableText(context, values.description,
                          textColor: AppColors.textColor.withOpacity(0.5),
                          size: 18)
                      : reusableText(context, values.description,
                          maxlines: 2,
                          overflowtype: TextOverflow.ellipsis,
                          size: 18,
                          textColor: AppColors.textColor.withOpacity(0.5)),
                  GestureDetector(
                      onTap: () {
                        print(state.showMore);
                        bool newShowMore = state.showMore ?? false;
                        context
                            .read<AppBlocs>()
                            .add(TriggertextEvent(showMore: !newShowMore));
                      },
                      child: state.showMore != null && state.showMore!
                          ? reusableText(context, "show less",
                              size: 18, textColor: Colors.blueGrey)
                          : reusableText(context, "show more",
                              size: 18, textColor: Colors.blueGrey)),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
