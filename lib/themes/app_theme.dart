import 'package:flutter/material.dart';
import 'package:restaurant_app/themes/color_schemes.dart';
import 'package:restaurant_app/themes/typography.dart';

class AppTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: HierarchyFont.displayLarge,
      displayMedium: HierarchyFont.displayMedium,
      displaySmall: HierarchyFont.displaySmall,
      headlineLarge: HierarchyFont.headlineLarge,
      headlineMedium: HierarchyFont.headlineMedium,
      headlineSmall: HierarchyFont.headlineSmall,
      titleLarge: HierarchyFont.titleLarge,
      titleMedium: HierarchyFont.titleMedium,
      titleSmall: HierarchyFont.titleSmall,
      bodyLarge: HierarchyFont.bodyLargeBold,
      bodyMedium: HierarchyFont.bodyLargeMedium,
      bodySmall: HierarchyFont.bodyLargeRegular,
      labelLarge: HierarchyFont.labelLarge,
      labelMedium: HierarchyFont.labelMedium,
      labelSmall: HierarchyFont.labelSmall,
    );
  }

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: RestaurantColors.primary.color,
      brightness: Brightness.light,
    ),
    textTheme: _textTheme,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: RestaurantColors.primary.color,
    ),
    textTheme: _textTheme,
    useMaterial3: true,
  );
}
