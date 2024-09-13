import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsInformations extends StatelessWidget {
  const NewsInformations(
      {super.key,
      required this.title,
      required this.source,
      required this.date});
  // final AsyncSnapshot<NewsHeadlinesModel> snapshot;
  final String title;
  final String source;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    final dateFormat = DateFormat('MMMM dd, yyyy');

    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(5),
      height: height * 0.15,
      width: width * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.7,
            height: height * 0.10,
            child: Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                source,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Spacer(),
              // SizedBox(width: width * 0.22),
              Text(
                dateFormat.format(date),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
