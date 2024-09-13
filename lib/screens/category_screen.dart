import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_head/view_model/view_news_model.dart';
import 'package:news_head/widgets/category_screen/display_category_news.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ViewNewsModel viewNewsModel = ViewNewsModel();

  String categoryName = 'general';

  List<String> allCategories = [
    'general',
    'entertainment',
    'health',
    'sports',
    'business',
    'technology',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allCategories.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      categoryName = allCategories[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: allCategories[index] == categoryName
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          allCategories[index],
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DisplayCtegoryNews(category: categoryName),
          ],
        ),
      ),
    );
  }
}
