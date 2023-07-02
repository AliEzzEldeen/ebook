import 'package:ebook/core/utils/api_services.dart';
import 'package:ebook/features/home/data/model/book_model/book_model.dart';

import '../../domain/entities/book_entitiy.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
        endPoint: 'Volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBooksList(data);

    return books;
  }


  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
    var data = await apiServices.get(
        endPoint: 'Volumes?volumes?Filtering=free-ebooks&q=programming&Sorting=newest ');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}


List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookMap in data['item']) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}

