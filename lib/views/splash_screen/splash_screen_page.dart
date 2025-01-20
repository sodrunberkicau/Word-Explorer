import 'package:flutter/material.dart';
import 'package:word_explorer/utils/contants/app_assets.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage(AppAssets.imgLogo),
                width: 151,
                height: 151,
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: Text(
                "Word Explorer",
                style: AppThemes.textTheme.headlineLarge?.copyWith(
                  color: AppThemes.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
