import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_head/screens/news_details_screen.dart';

import 'package:news_head/view_model/view_news_model.dart';
import 'package:news_head/models/news_headlines_model.dart';
import 'package:news_head/widgets/home_screen/first_row/news_image.dart';
import 'package:news_head/widgets/home_screen/first_row/news_informations.dart';

class FirstRowHeadlines extends StatelessWidget {
  const FirstRowHeadlines({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    ViewNewsModel viewNewsModel = ViewNewsModel();

    return ListView(
      children: [
        SizedBox(
          height: height * 0.45,
          width: width,
          child: FutureBuilder<NewsHeadlinesModel>(
            future: viewNewsModel.fetchNewsHeadlinesApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SpinKitChasingDots(
                    size: 50,
                    color: Colors.blue,
                  ),
                );
              }

              if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data!.articles == null) {
                return Center(
                  child: Text(
                      'Something went wrong. Please try again later.\n${snapshot.error.toString()}'),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DateTime dateTime = DateTime.parse(
                    snapshot.data!.articles![index].publishedAt.toString(),
                  );

                  final currentNewsDetails = snapshot.data!.articles![index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewsDetailsScreen(
                            newsHeadlineArticle: currentNewsDetails,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          NewsImage(
                            imageUrl: snapshot.data!.articles![index].urlToImage
                                .toString(),
                          ),
                          Positioned(
                            bottom: 20,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: NewsInformations(
                                title: snapshot.data!.articles![index].title
                                    .toString(),
                                source: snapshot
                                    .data!.articles![index].source!.name
                                    .toString(),
                                date: dateTime,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
