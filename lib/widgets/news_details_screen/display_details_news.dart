import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:news_head/models/news_headlines_model.dart';
import 'package:news_head/widgets/home_screen/first_row/news_image.dart';
import 'package:news_head/widgets/news_details_screen/text_field_display.dart';

class DisplayDetailsNews extends StatefulWidget {
  const DisplayDetailsNews({super.key, required this.newsArticle});
  final Articles newsArticle;

  @override
  State<DisplayDetailsNews> createState() => _DisplayDetailsNewsState();
}

class _DisplayDetailsNewsState extends State<DisplayDetailsNews> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    final dateFormat = DateFormat('MMMM dd, yyyy');
    final date = DateTime.parse(widget.newsArticle.publishedAt.toString());

    final Uri newsUrl = Uri.parse(widget.newsArticle.url.toString());

    return SizedBox(
      width: width * 1,
      // height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.45,
            child: NewsImage(
              imageUrl: widget.newsArticle.urlToImage.toString(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                child: ListView(
                  children: [
                    TextFieldDisplay(
                        textValue: widget.newsArticle.title.toString(),
                        identifier: 'title'),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        widget.newsArticle.author != null
                            ? TextFieldDisplay(
                                textValue: widget.newsArticle.author.toString(),
                                identifier: 'author',
                              )
                            : const TextFieldDisplay(
                                textValue: 'Unknown Author',
                                identifier: 'author',
                              ),
                        const Spacer(),
                        TextFieldDisplay(
                          textValue: widget.newsArticle.source!.name.toString(),
                          identifier: 'source',
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextFieldDisplay(
                      textValue: dateFormat.format(date),
                      identifier: 'date',
                    ),
                    const SizedBox(height: 5),
                    TextFieldDisplay(
                      textValue: widget.newsArticle.description.toString(),
                      identifier: 'body',
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: const WidgetStatePropertyAll(10),
                        backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () async {
                        // await launchUrl(newsUrl);
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Opening external browser'),
                          ),
                        );

                        await launchUrl(newsUrl);
                      },
                      child: Text(
                        'Real Article',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
