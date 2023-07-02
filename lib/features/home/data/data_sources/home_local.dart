import '../../domain/entities/book_entitiy.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}


class HomeLocalDataImpl extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchFeaturedBooks() {

    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {

    throw UnimplementedError();
  }

}
