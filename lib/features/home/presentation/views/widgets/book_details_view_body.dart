import 'package:flutter/material.dart';
import 'books_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                CustomBookDetailsView(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(height: 50),
                ),
               SimilarBooksSection(),
                SizedBox(height: 40,),
              ],
            ),
          )
        ],

      ),
    );
  }
}


