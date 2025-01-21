import 'package:flutter/material.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';

class SearchWordNotFound extends StatelessWidget {
  const SearchWordNotFound({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 141.34,
            color: AppThemes.colorScheme.outlineVariant,
          ),
          const SizedBox(
            height: 13.46,
          ),
          Text(
            'No Definitions Found',
            style: AppThemes.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            "Sorry pal, we couldn't find definitions for the word you were looking for. You can try the search again at later time or head to the web instead.",
            style: AppThemes.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text(
              'Try Again',
            ),
          ),
        ],
      ),
    );
  }
}
