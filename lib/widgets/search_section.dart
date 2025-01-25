import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'What do you want to know?',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 40,
            height: 1.2,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 36),
        Container(
          width: 700,
          decoration: BoxDecoration(
              color: AppColors.searchBar,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.searchBarBorder)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ask anything...',
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.format_list_bulleted_outlined),
                        label: const Text('Focus')),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline_outlined),
                        label: const Text('Attach')),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          ChatWebService().chat(queryController.text.trim());
                        },
                        icon: const Icon(
                            color: AppColors.submitButton,
                            Icons.arrow_circle_right_sharp)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
