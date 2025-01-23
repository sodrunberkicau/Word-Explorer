import 'package:flutter/material.dart';
import 'package:word_explorer/models/word_model.dart';
import 'package:word_explorer/utils/audio_player_utils/audio_player_utils.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';

class SearchWordResults extends StatelessWidget {
  const SearchWordResults({super.key, required this.wordData});

  final WordModel wordData;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 26,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppThemes.colorScheme.outlineVariant,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wordData.word ?? '-',
              style: AppThemes.textTheme.headlineMedium,
            ),
            const SizedBox(height: 9),
            Visibility(
              visible: wordData.phonetic != null &&
                  wordData.phonetics?.first != null,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      wordData.phonetic ?? '-',
                      style: AppThemes.textTheme.headlineSmall?.copyWith(
                        color: AppThemes.colorScheme.primary,
                        fontFamily: AppThemes.vocesFontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: wordData.phonetics?.first.audio != null &&
                        wordData.phonetics?.first.audio != '',
                    child: IconButton(
                        onPressed: () {
                          debugPrint(
                              'audio Url: ${wordData.phonetics?.first.audio}');

                          AudioPlayerUtils.play(
                              wordData.phonetics!.first.audio!);
                        },
                        icon: Icon(
                          Icons.volume_up,
                          color: AppThemes.colorScheme.primary,
                        )),
                  )
                ],
              ),
            ),
            Divider(
              color: AppThemes.colorScheme.outlineVariant,
              thickness: 1,
            ),
            ...wordData.meanings!.map(
              (meaning) => TileSearchWordResult(
                title: "${meaning.partOfSpeech?.toUpperCase()} Definition",
                body: meaning.definitions?.first.definition ?? '-',
                isHasSynonym: meaning.synonyms?.isNotEmpty ?? false,
                isHasAntonym: meaning.antonyms?.isNotEmpty ?? false,
                listSynonyms: meaning.synonyms ?? [],
                listAntonyms: meaning.antonyms ?? [],
              ),
            ),
          ],
        ));
  }
}

class TileSearchWordResult extends StatelessWidget {
  const TileSearchWordResult({
    super.key,
    required this.title,
    required this.body,
    this.isHasSynonym = false,
    this.isHasAntonym = false,
    this.isShowDivider = true,
    required this.listSynonyms,
    required this.listAntonyms,
  });

  final String title;
  final String body;
  final bool isHasSynonym;
  final bool isHasAntonym;
  final bool isShowDivider;
  final List<String> listSynonyms;
  final List<String> listAntonyms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppThemes.textTheme.titleLarge?.copyWith(
              color: AppThemes.colorScheme.tertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            body,
            style: AppThemes.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isHasSynonym,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Synonyms',
                        style: AppThemes.textTheme.titleMedium?.copyWith(
                          color: AppThemes.colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ...listSynonyms.map(
                        (synonym) => Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    AppThemes.colorScheme.onSurface,
                                radius: 3,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  synonym,
                                  style: AppThemes.textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isHasAntonym,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Antonym',
                        style: AppThemes.textTheme.titleMedium?.copyWith(
                          color: AppThemes.colorScheme.tertiary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ...listAntonyms.map(
                        (antonym) => Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    AppThemes.colorScheme.onSurface,
                                radius: 3,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  antonym,
                                  style: AppThemes.textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Visibility(
            visible: isShowDivider,
            child: Divider(
              color: AppThemes.colorScheme.outlineVariant,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
