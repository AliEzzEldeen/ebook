import 'package:dartz/dartz.dart';
import 'package:ebook/core/error/failure.dart';
import '../entities/book_entitiy.dart';

abstract class HomeRepo
{
  Future<Either< Failure , List<BookEntity>>> fetchFeaturedBooks();
  Future<Either< Failure , List<BookEntity>>> fetchNewestBooks();
}

