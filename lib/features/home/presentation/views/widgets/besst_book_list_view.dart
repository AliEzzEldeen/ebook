import 'package:ebook/features/home/presentation/views/widgets/best_book_view_item.dart';
import 'package:flutter/material.dart';

class BestBookListView extends StatelessWidget {
  const BestBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index)
      {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BestBooksViewItem(),
        );
      },
    );
  }
}