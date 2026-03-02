import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF667eea);
  static const Color primaryDark = Color(0xFF764ba2);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF11998e);
  static const Color secondaryLight = Color(0xFF38ef7d);
  
  // Accent Colors
  static const Color accent = Color(0xFFf59e0b);
  static const Color danger = Color(0xFFef4444);
  static const Color success = Color(0xFF10b981);
  
  // Neutral Colors
  static const Color background = Color(0xFFf0f2f5);
  static const Color surface = Color(0xFFffffff);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF999999);
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
