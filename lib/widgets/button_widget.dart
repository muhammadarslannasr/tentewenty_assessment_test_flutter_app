import 'package:flutter/material.dart';
import 'package:tentwenty_assessmen_test/utils/app_colors.dart';
import 'package:tentwenty_assessmen_test/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final double radius;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final double width;
  final double height;
  final VoidCallback onPress;

  const ButtonWidget({
    super.key,
    required this.title,
    this.radius = 0,
    this.color = AppColors.blackColor,
    this.textColor = AppColors.blackColor,
    this.borderColor,
    required this.width,
    required this.height,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: TextWidget(
          title: title,
          color: textColor,
        ),
      ),
    );
  }
}
