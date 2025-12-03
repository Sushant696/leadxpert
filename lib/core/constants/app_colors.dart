import 'package:flutter/material.dart';

/// Application-wide color constants
/// Use these colors throughout the app for consistency
class AppColors {
  // Prevent instantiation
  AppColors._();

  // Primary Colors (Blue Theme - Professional & Trustworthy)
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color primaryLight = Color(0xFF3B82F6);

  // Secondary/Accent Colors
  static const Color accent = Color(0xFF60A5FA);
  static const Color secondary = Color(0xFF8B5CF6);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Neutral Colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color border = Color(0xFFE5E7EB);
  static const Color background = Color(0xFFF9FAFB);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE5E7EB);

  // Basic Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Lead Status Colors (for your lead management system)
  static const Color statusNew = Color(0xFF3B82F6); // Blue
  static const Color statusContacted = Color(0xFFF59E0B); // Orange
  static const Color statusQualified = Color(0xFF8B5CF6); // Purple
  static const Color statusConverted = Color(0xFF10B981); // Green
  static const Color statusLost = Color(0xFFEF4444); // Red
}
