import 'package:news_head/models/categories_news_model.dart';
import 'package:news_head/models/news_headlines_model.dart';
import 'package:news_head/repository/news_repository.dart';

class ViewNewsModel {
  final repo = NewsRepository();

  Future<NewsHeadlinesModel> fetchNewsHeadlinesApi() async {
    NewsHeadlinesModel response = await repo.fetchNewsHeadlinesApi();

    return response;
  }

  Future<CategoryNewsModel> fetchNewsCategoriesApi(String category) async {
    CategoryNewsModel response = await repo.fetchNewsCategoriesApi(category);

    return response;
  }
}
