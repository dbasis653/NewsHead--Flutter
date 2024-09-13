import 'package:flutter/material.dart';

import 'package:news_head/models/news_headlines_model.dart';
// import 'package:news_head/models/categories_news_model.dart';
import 'package:news_head/widgets/news_details_screen/display_details_news.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.newsHeadlineArticle});
  final Articles newsHeadlineArticle;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DisplayDetailsNews(newsArticle: widget.newsHeadlineArticle),
    );
  }
}
