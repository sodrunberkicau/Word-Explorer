import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:word_explorer/models/word_model.dart';
import 'package:word_explorer/utils/contants/api_base_url.dart';

class DictionaryApiServices {
  Future<WordModel> getWordDefinition({required String word}) async {
    try {
      final response = await http.get(Uri.parse('$apiBaseUrl/$word'));
      if (response.statusCode == 200) {
        final List<dynamic> responseBody = jsonDecode(response.body);
        return WordModel.fromJson(responseBody.first);
      }
      throw 'Failed to search word';
    } catch (_) {
      rethrow;
    }
  }
}
