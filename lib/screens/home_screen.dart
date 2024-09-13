import 'package:flutter/material.dart';
import 'package:news_head/screens/category_screen.dart';
import 'package:news_head/widgets/category_screen/display_category_news.dart';
// import 'package:news_head/widgets/filter_news_channels/filter_widget.dart';

import 'package:news_head/widgets/home_screen/first_row_headlines.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CategoryScreen(),
                ),
              );
            },
            icon: Image.asset(
              'images/category_icon.png',
              height: 30,
              width: 30,
            )),
        title: const Text(
          'News',
          style: TextStyle(fontSize: 26),
        ),
      ),
      // body: FirstRowHeadlines(),
      body: const Column(
        children: [
          Expanded(
            child: FirstRowHeadlines(),
          ),
          SizedBox(height: 20),
          Expanded(
            child: DisplayCtegoryNews(
              category: 'general',
            ),
          ),
        ],
      ),
    );
  }
}
