import 'package:flutter/material.dart';
import 'package:word_explorer/utils/contants/app_assets.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';
import 'package:word_explorer/views/dictionary/dictionary_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            children: [
              const SizedBox(height: 120), // Jarak atas
              const Center(
                child: Image(
                  image:
                      AssetImage(AppAssets.imgOnboarding), // Gambar onboarding
                  width: 314.69,
                  height: 301,
                ),
              ),
              const SizedBox(height: 66), // Jarak setelah gambar
              Center(
                child: Text(
                  'Welcome To WordExplorer',
                  style: AppThemes.textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 25), // Jarak setelah judul
              Center(
                child: Text(
                  "Quickly find the word you're looking for with our easy-to-use search feature.",
                  style: AppThemes.textTheme.bodyLarge,
                  textAlign: TextAlign.center, // Teks rata tengah
                ),
              ),
              const SizedBox(height: 145), // Jarak sebelum tombol
              ElevatedButton(
                child: const Text('Get Started'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const DictionaryPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
