import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_head/screens/category_news_details_screen.dart';
import 'package:news_head/view_model/view_news_model.dart';
import 'package:news_head/widgets/home_screen/first_row/news_image.dart';

class DisplayCtegoryNews extends StatelessWidget {
  const DisplayCtegoryNews({super.key, required this.category});

  final String category;
  // final Articles newsArticle;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMMM dd, yyyy');
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    ViewNewsModel viewNewsModel = ViewNewsModel();
    return Expanded(
      child: FutureBuilder(
        future: viewNewsModel.fetchNewsCategoriesApi(category),
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
            itemBuilder: (context, index) {
              final imageUrl = snapshot.data!.articles![index].urlToImage;

              final date = DateTime.parse(
                  snapshot.data!.articles![index].publishedAt.toString());

              return InkWell(
                onTap: () {
                  final currentNewsDetails = snapshot.data!.articles![index];

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryNewsDetailsScreen(
                          newsHeadlineArticle: currentNewsDetails),
                    ),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: height * 0.28,
                      width: width * 0.5,
                      child: NewsImage(
                        imageUrl: imageUrl.toString(),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.18,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 2,
                              snapshot.data!.articles![index].title.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                            const Spacer(),
                            Text(
                                snapshot.data!.articles![index].source!.name
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Colors.black54)),
                            Text(dateFormat.format(date),
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Colors.black54)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
