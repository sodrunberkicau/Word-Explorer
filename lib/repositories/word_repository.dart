import 'package:word_explorer/models/word_model.dart';
import 'package:word_explorer/services/dictionary_api_services.dart';

class WordRepository {
  WordRepository({DictionaryApiServices? dictionaryApiServices})
      : _dictionaryApiServices =
            dictionaryApiServices ?? DictionaryApiServices();

  final DictionaryApiServices _dictionaryApiServices;

  Future<WordModel> searchWord({required String word}) async {
    try {
      final searchResult =
          await _dictionaryApiServices.getWordDefinition(word: word);
      return searchResult;
    } catch (e) {
      throw Exception(e);
    }
  }
}
