import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6200EE);
  static const Color secondary = Color(0xFF03DAC6);

  // Background Colors
  static const Color background = Color(0xFFFFF);
  static const Color surface = Colors.white;

  // Status Colors
  static const Color error = Color(0xFFB00020);

  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color grey500 = Color(0xFF9E9E9E);
}

class AppTextStyles {
  static const todoContent = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary
  );

  static const todoCompleted = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.grey500,
    decoration: TextDecoration.lineThrough
  );

  static const todoDate = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary
  );

  static const statCount = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold
  );
}

class AppSpacing {
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
}


class AppRadius {
  static const double md = 12.0;
  static BorderRadius get mediumRadius => BorderRadius.circular(md);
}