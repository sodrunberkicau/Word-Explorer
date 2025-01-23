import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:word_explorer/viewmodels/word_viewmodel.dart';
import 'package:word_explorer/utils/contants/app_assets.dart';
import 'package:word_explorer/utils/contants/app_theme.dart';

import 'package:word_explorer/widgets/search_word_initial.dart';
import 'package:word_explorer/widgets/search_word_not_found.dart';
import 'package:word_explorer/widgets/search_word_results.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  TextEditingController searchTextEditingController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  String searchQuery = '';

  @override
  void dispose() {
    super.dispose();
    searchTextEditingController.dispose();
    searchQuery = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                AppAssets.imgLogo,
              ),
              width: 39,
              height: 39,
            ),
            const SizedBox(width: 7),
            Text(
              'Word Explorer',
              style: AppThemes.textTheme.headlineMedium,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            26,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: searchTextEditingController,
                focusNode: searchFocusNode,
                textInputAction: TextInputAction.search,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                onFieldSubmitted: (_) {
                  context.read<WordViewModel>().searchWord(searchQuery);
                },
                decoration: const InputDecoration()
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
                    .copyWith(
                      hintText: 'Search Any Word...',
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 7,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor:
                              AppThemes.colorScheme.surfaceContainerHighest,
                          child: SvgPicture.asset(
                            AppAssets.icSearch,
                            width: 20.67,
                            height: 20.67,
                          ),
                        ),
                      ),
                      suffixIcon: Visibility(
                        visible: searchQuery.isNotEmpty,
                        child: IconButton(
                          onPressed: () {
                            searchTextEditingController.clear();
                            setState(() {
                              searchQuery = '';
                            });
                            context.read<WordViewModel>().resetSearch();
                          },
                          icon: Icon(
                            Icons.close,
                            color: AppThemes.colorScheme.error,
                          ),
                        ),
                      ),
                    ),
              ),
              Consumer<WordViewModel>(
                builder: (context, viewModel, child) {
                  return switch (viewModel.state) {
                    WordState.initial => const SearchWordInitial(),
                    WordState.loading => const Padding(
                        padding: EdgeInsets.only(top: 300.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    WordState.success => SearchWordResults(
                        wordData: viewModel.wordData!,
                      ),
                    WordState.error => SearchWordNotFound(
                        onPressed: () {
                          searchTextEditingController.clear();
                          searchFocusNode.requestFocus();
                          context.read<WordViewModel>().resetSearch();
                        },
                      ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
