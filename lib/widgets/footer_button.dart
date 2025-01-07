import 'package:flutter/material.dart';

import '../theme/colors.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({super.key, required this.text, this.icon});

  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      iconAlignment: IconAlignment.end,
      icon: Icon(
        icon,
        size: 16,
        color: AppColors.footerGrey,
      ),
      onPressed: () {},
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.zero), // Remove padding
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Minimize button size
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<WidgetState> states) {
            // Add underline when hovered
            if (states.contains(WidgetState.hovered)) {
              return const TextStyle(decoration: TextDecoration.underline);
            }
            // Default style
            return const TextStyle(decoration: TextDecoration.none);
          },
        ),
      ),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.footerGrey,
        ),
      ),
    );
  }
}
