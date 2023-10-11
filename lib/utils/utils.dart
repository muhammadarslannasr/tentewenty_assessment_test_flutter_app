import 'package:flutter/material.dart';
import 'package:tentwenty_assessmen_test/utils/app_colors.dart';

class Utils{

  static errorBody({required message}) {
    return Center(
      child: Text(
        message,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.bottomBarColor,
        ),
      ),
    );
  }

  static Widget horizontalDivider() {
    return Container(
      height: 1,
      color: AppColors.bottomBarColor.withOpacity(0.2),
    );
  }

}