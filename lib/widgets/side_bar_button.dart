import 'package:flutter/material.dart';
import '../theme/colors.dart';

class SideBarButton extends StatelessWidget {
  final bool isCollapsed;
  final String text;
  final IconData icon;
  const SideBarButton({
    super.key,
    required this.icon,
    required this.text,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            icon,
            color: AppColors.whiteColor,
            size: 25,
          ),
        ),
        isCollapsed
            ? Container()
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
      ],
    );
  }
}
