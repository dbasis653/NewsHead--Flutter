import 'package:flutter/material.dart';

import 'package:news_head/models/categories_news_model.dart';
import 'package:news_head/widgets/news_details_screen/display_category_details_news.dart';

class CategoryNewsDetailsScreen extends StatefulWidget {
  const CategoryNewsDetailsScreen(
      {super.key, required this.newsHeadlineArticle});
  final Articles newsHeadlineArticle;

  @override
  State<CategoryNewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<CategoryNewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DisplayCategoryDetailsNews(newsArticle: widget.newsHeadlineArticle),
    );
  }
}
