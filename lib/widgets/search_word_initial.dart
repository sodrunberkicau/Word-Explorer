import 'package:flutter/material.dart';
import 'package:word_explorer/utils/contants/app_assets.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';

class SearchWordInitial extends StatelessWidget {
  const SearchWordInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 92),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              AppAssets.imgInitialSearch,
            ),
            width: 207.49,
            height: 222.22,
          ),
          const SizedBox(height: 46.97),
          Text(
            "Get Detailed Results",
            style: AppThemes.textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 25.49,
          ),
          Text(
            "Access definitions, pronunciations with audio, and word types like noun, verb, and more.",
            style: AppThemes.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
