import '../entities/book_entitiy.dart';

abstract class HomeRepo
{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}