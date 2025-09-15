import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xFFF6BD00);
  static const black = Color(0xFF121312);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFE82626);
  static const gray = Color(0x99FFFFFF);
  static const inputColor = Color(0xFF282A28);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: white,
      ),

      filled: true,
      fillColor: inputColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: gray),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1, color: gray),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1, color: red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1, color: red),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: black,
      foregroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: primary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF282A28),
      type: BottomNavigationBarType.fixed,
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: white,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
