import 'package:flutter/material.dart';
import 'package:perplexity_clone/widgets/footer_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Wrap(
        alignment: WrapAlignment.center,
        children: [
          FooterButton(text: 'Pro'),
          FooterButton(text: 'Entreprise'),
          FooterButton(text: 'Store'),
          FooterButton(text: 'Blog'),
          FooterButton(text: 'Careers'),
          FooterButton(
            text: 'English (English)',
            icon: Icons.keyboard_arrow_down_sharp,
          ),
        ],
      ),
    );
  }
}
