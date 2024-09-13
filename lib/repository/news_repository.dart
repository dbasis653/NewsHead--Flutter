import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_head/models/categories_news_model.dart';
import 'package:news_head/models/news_headlines_model.dart';

class NewsRepository {
  Future<NewsHeadlinesModel> fetchNewsHeadlinesApi() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=2bb61e46ccc046949448712fedafd897';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return NewsHeadlinesModel.fromJson(responseBody);
    }
    throw Exception('Cannot retrieve information');
  }

  Future<CategoryNewsModel> fetchNewsCategoriesApi(String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=$category&apiKey=2bb61e46ccc046949448712fedafd897';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return CategoryNewsModel.fromJson(responseBody);
    }
    throw Exception('Cannot retrieve information');
  }
}
