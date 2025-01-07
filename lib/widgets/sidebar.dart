import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/side_bar_button.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          SideBarButton(
              icon: Icons.auto_awesome_mosaic,
              text: 'Perplexity',
              isCollapsed: isCollapsed),
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                SideBarButton(
                    icon: Icons.add, text: 'New', isCollapsed: isCollapsed),
                const SizedBox(
                  height: 32,
                ),
                SideBarButton(
                    icon: Icons.search_outlined,
                    text: 'Search',
                    isCollapsed: isCollapsed),
                const SizedBox(
                  height: 14,
                ),
                SideBarButton(
                    icon: Icons.public_outlined,
                    text: 'Spaces',
                    isCollapsed: isCollapsed),
                const SizedBox(
                  height: 14,
                ),
                SideBarButton(
                    icon: Icons.group_work_outlined,
                    text: 'Discover',
                    isCollapsed: isCollapsed),
                const SizedBox(
                  height: 14,
                ),
                SideBarButton(
                    icon: Icons.library_books_outlined,
                    text: 'Library',
                    isCollapsed: isCollapsed),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Icon(
                    isCollapsed
                        ? Icons.keyboard_double_arrow_right
                        : Icons.keyboard_double_arrow_left,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
