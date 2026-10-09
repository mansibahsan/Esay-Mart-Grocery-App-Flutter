import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary brand palette from UI Kit
  static const Color primary = Color(0xFF2E9E4D);
  static const Color primaryLight = Color(0xFFE9F5EC);
  static const Color primaryDark = Color(0xFF1F7A38);
  static const Color primaryAccent = Color(0xFF38B75B);

  // Background and Surfaces
  static const Color background = Color(0xFFF9FAF9);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF4F6F5);

  // Typography Colors
  static const Color textPrimary = Color(0xFF1E2243);
  static const Color textSecondary = Color(0xFF7D8797);
  static const Color textMuted = Color(0xFF9EABB8);
  static const Color textLight = Color(0xFFFFFFFF);

  // Accents & Badges
  static const Color badgeOrange = Color(0xFFFF7A00);
  static const Color badgeYellow = Color(0xFFFFB800);
  static const Color badgeRed = Color(0xFFE53935);
  static const Color success = Color(0xFF2E9E4D);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935);

  // Neutral & Borders
  static const Color border = Color(0xFFE5E9E7);
  static const Color borderSubtle = Color(0xFFEFF2F0);
  static const Color divider = Color(0xFFF0F3F1);

  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: const Color(0xFF1E2243).withAlpha(15),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withAlpha(10),
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ];
}
