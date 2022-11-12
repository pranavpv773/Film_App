import 'package:film_app/app/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle h1 = TextStyle(
    letterSpacing: 1,
    fontWeight: FontWeight.w400,
    color: AppColors.kWhite,
    fontSize: 30,
  );

  static TextStyle h2 = TextStyle(
    letterSpacing: 1,
    color: AppColors.kGrey,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle headings = TextStyle(
    color: AppColors.kWhite,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  static TextStyle formField = TextStyle(
    color: AppColors.kGrey,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static TextStyle h3 = const TextStyle(
    color: Colors.grey,
    fontSize: 16,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 8,
    color: AppColors.kSecondary,
  );
}
