import 'package:flutter/material.dart';
import 'package:word_explorer/viewmodels/word_viewmodel.dart';

import 'package:word_explorer/word_explorer_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<WordViewModel>(
      create: (context) => WordViewModel(),
      child: const WordExplorerApp(),
    ),
  );
}
