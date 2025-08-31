import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFFF6BD00);
  static const black = Color(0xFF121312);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFE82626);
  static const gray = Color(0x99FFFFFF);

  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: white,
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        color: white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
