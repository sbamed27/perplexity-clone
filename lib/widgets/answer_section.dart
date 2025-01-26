import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_clone/services/chat_web_service.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  String fullResponse = '';

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      setState(() {
        fullResponse += data['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Perplexity',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Markdown(
          data: fullResponse,
          shrinkWrap: true,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            codeblockDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            code: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
