import 'package:ebook/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsView(),
          const SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .17 ),
            child: const ListViewItem(),
          )
        ],
      ),
    );
  }
}



