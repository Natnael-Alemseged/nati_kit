import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  // Prevent instantiation
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // Primary Colors
      primaryColor: kcPrimaryColor,
      scaffoldBackgroundColor: kcBackgroundColor,

      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: kcPrimaryColor,
        primary: kcPrimaryColor,
        secondary: kcPrimaryColorDark,
        surface: kcSurfaceColor,
        error: kcRed,
        outline: kcLightGrey,
      ),

      // Text Theme (Using Poppins as standard, customize as needed)
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: kcBlack),
        bodySmall: TextStyle(color: kcGrey66),
        titleLarge: TextStyle(color: kcBlack, fontWeight: FontWeight.bold),
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: kcPrimaryColor,
        foregroundColor: kcWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: kcWhite),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kcPrimaryColor,
          foregroundColor: kcWhite,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),

      // Input Decoration Theme (Matches InputField style)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: kcVeryLightGrey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kcLightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kcLightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kcPrimaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kcRed, width: 1.5),
        ),
      ),
    );
  }
}
