import 'package:flutter/material.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';

class SearchWordResults extends StatelessWidget {
  const SearchWordResults({super.key});

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
              'religion',
              style: AppThemes.textTheme.headlineMedium,
            ),
            const SizedBox(height: 9),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "/ɹɪˈlɪdʒən/",
                    style: AppThemes.textTheme.headlineSmall?.copyWith(
                      color: AppThemes.colorScheme.primary,
                      fontFamily: AppThemes.vocesFontFamily,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_up,
                      color: AppThemes.colorScheme.primary,
                    ))
              ],
            ),
            Divider(
              color: AppThemes.colorScheme.outlineVariant,
              thickness: 1,
            ),
            const TileSearchWordResult(
              title: "Noun Definition",
              body:
                  "Belief in a spiritual or metaphysical reality (often including at least one deity), accompanied by practices or rituals pertaining to the belief.",
              isHasSynonym: true,
              isHasAntonym: true,
              listSynonyms: ["faith", "faith", "superstition"],
              listAntonyms: ["coba"],
            ),
            const TileSearchWordResult(
              title: "Verb Definition",
              body: "Engage in religious practice",
              listSynonyms: [],
              listAntonyms: [],
              isShowDivider: false,
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
