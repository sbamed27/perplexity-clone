import 'package:flutter/material.dart';
import 'package:perplexity_clone/widgets/search_section.dart';
import 'package:perplexity_clone/widgets/sidebar.dart';

import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SearchSection(),
                ),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
