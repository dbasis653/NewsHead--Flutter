import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:news_head/models/news_headlines_model.dart';

class NewsImage extends StatelessWidget {
  // const NewsImage({super.key, required this.snapshot, required this.imageUrl});
  const NewsImage({super.key, required this.imageUrl});

  // final AsyncSnapshot snapshot;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    // ViewNewsModel viewNewsModel = ViewNewsModel();

    // final dateFormat = DateFormat('MMMM dd, yyyy');
    return Container(
      width: width * 0.9,
      height: height * 0.66,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const SpinKitCircle(
            size: 50,
            color: Colors.blue,
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
