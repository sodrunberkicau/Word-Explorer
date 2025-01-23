class WordModel {
  String? word;
  String? phonetic;
  List<Phonetics>? phonetics;
  List<Meanings>? meanings;

  WordModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
  });

  WordModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    phonetic = json['phonetic'];

    if (json['phonetics'] != null) {
      phonetics = <Phonetics>[];
      json['phonetics'].forEach((v) {
        phonetics!.add(Phonetics.fromJson(v));
      });
    }

    if (json['meanings'] != null) {
      meanings = <Meanings>[];
      json['meanings'].forEach((v) {
        meanings!.add(Meanings.fromJson(v));
      });
    }
  }
}

class Phonetics {
  String? audio;

  Phonetics({this.audio});

  Phonetics.fromJson(Map<String, dynamic> json) {
    audio = json['audio'];
  }
}

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;
  List<String>? synonyms;
  List<String>? antonyms;

  Meanings({this.partOfSpeech, this.definitions, this.synonyms, this.antonyms});

  Meanings.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = <Definitions>[];
      definitions?.add(Definitions.fromJson(json['definitions'][0]));
    }

    synonyms = json['synonyms'].cast<String>();
    antonyms = json['antonyms'].cast<String>();
  }
}

class Definitions {
  String? definition;

  Definitions({this.definition});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
  }
}
