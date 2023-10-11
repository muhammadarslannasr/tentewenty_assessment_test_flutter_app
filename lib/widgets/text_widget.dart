import 'package:flutter/material.dart';
import 'package:tentwenty_assessmen_test/utils/app_colors.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration decoration;
  final int maxLines;
  final TextOverflow? overflow;

  const TextWidget({
    Key? key,
    required this.title,
    this.color = AppColors.blackColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.decoration = TextDecoration.none,
    this.maxLines = 1,
    this.overflow,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}
