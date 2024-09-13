import 'package:flutter/material.dart';

enum FilterListNewsChannels { abcNews, bbcNews, bloomberg, cnn }

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String name = 'abc-news';

  @override
  Widget build(BuildContext context) {
    FilterListNewsChannels? selectedFilter;

    return PopupMenuButton(
      initialValue: selectedFilter,
      onSelected: (value) {
        if (FilterListNewsChannels.bbcNews.name == value.name) {
          name = 'bbc-news';
        }

        if (FilterListNewsChannels.bloomberg.name == value.name) {
          name = 'bloomberg';
        }

        if (FilterListNewsChannels.cnn.name == value.name) {
          name = 'cnn';
        }

        if (FilterListNewsChannels.abcNews.name == value.name) {
          name = 'abc-news';
        }

        setState(() {
          selectedFilter = value;
        });
      },
      itemBuilder: (context) => <PopupMenuEntry<FilterListNewsChannels>>[
        const PopupMenuItem<FilterListNewsChannels>(
          value: FilterListNewsChannels.abcNews,
          child: Text('ABC News'),
        ),
        const PopupMenuItem<FilterListNewsChannels>(
          value: FilterListNewsChannels.bbcNews,
          child: Text('bbc News'),
        ),
        const PopupMenuItem<FilterListNewsChannels>(
          value: FilterListNewsChannels.bloomberg,
          child: Text('Bloomberg'),
        ),
        const PopupMenuItem<FilterListNewsChannels>(
          value: FilterListNewsChannels.cnn,
          child: Text('CNN'),
        ),
      ],
    );
  }
}
