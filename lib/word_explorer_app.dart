import 'package:flutter/material.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';
import 'package:word_explorer/views/splash_screen/splash_screen_page.dart';

class WordExplorerApp extends StatelessWidget {
  const WordExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Word Explorer',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: AppThemes.fontFamily,
        textTheme: AppThemes.textTheme,
        colorScheme: AppThemes.colorScheme,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: AppThemes.elevatedButtonThemeData,
        inputDecorationTheme: AppThemes.inputDecorationTheme,
      ),
      home: const SplashScreenPage(),
    );
  }
}
