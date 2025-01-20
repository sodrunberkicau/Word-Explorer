import 'package:flutter/material.dart';

class AppThemes {
  const AppThemes._();
  static String fontFamily = 'Nunito';
  static String vocesFontFamily = 'Voces';

  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xff4E9262),
    primary: const Color(0xff4E9262),
    secondary: const Color(0xff426915),
    tertiary: const Color(0xff006D40),
    surface: const Color(0xffF6FCE8),
    surfaceVariant: const Color(0xffDCE6CB),
    onSurface: const Color(0xff181D12),
    outline: const Color(0xff717A64),
    outlineVariant: const Color(0xffC0CAB0),
    error: const Color(0xffDE3730),
  );

  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 32,
      color: colorScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 28,
      color: colorScheme.onSurface,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
      fontSize: 24,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: colorScheme.onSurface,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: colorScheme.onSurface,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: colorScheme.onSurface,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: colorScheme.onSurface,
    ),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: Colors.white,
      textStyle: textTheme.labelLarge,
      minimumSize: const Size(240, 44),
    ),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: colorScheme.surface,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: colorScheme.outlineVariant,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: colorScheme.tertiary,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: colorScheme.outlineVariant,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: colorScheme.onSurface.withOpacity(0.12),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: colorScheme.error,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: colorScheme.error,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
  );
}
