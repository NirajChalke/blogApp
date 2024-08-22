import 'package:flutter/material.dart';

Widget reusableText(BuildContext context, String title, {double? size,Color? textColor,int?maxlines,TextOverflow ?overflowtype,FontWeight?fontWeight }) {
  return Text(
    title,
    style: Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontSize: size, fontFamily: "RobotoSlab",color:textColor  ,fontWeight: fontWeight),
        maxLines: maxlines,
        overflow: overflowtype,
  );
}
