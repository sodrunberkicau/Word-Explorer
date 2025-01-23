import 'package:flutter/material.dart';
import 'package:word_explorer/models/word_model.dart';
import 'package:word_explorer/repositories/word_repository.dart';

enum WordState { initial, loading, success, error }

class WordViewModel extends ChangeNotifier {
  final WordRepository _repository;

  WordViewModel({WordRepository? wordRepository})
      : _repository = wordRepository ?? WordRepository();

  WordState _state = WordState.initial;
  WordState get state => _state;

  WordModel? _wordData;
  WordModel? get wordData => _wordData;

  String? _error;
  String? get error => _error;

  void resetSearch() {
    _state = WordState.initial;
    _error = '';
    _wordData = null;
    notifyListeners();
  }

  Future<void> searchWord(String word) async {
    _state = WordState.loading;
    notifyListeners();

    try {
      _wordData = await _repository.searchWord(word: word);
      _state = WordState.success;
    } catch (e) {
      debugPrint(e.toString());
      _error = e.toString();
      _state = WordState.error;
    }

    notifyListeners();
  }
}
