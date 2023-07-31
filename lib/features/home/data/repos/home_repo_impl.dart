import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ebook/core/error/failure.dart';
import 'package:ebook/features/home/data/data_sources/home_local.dart';
import 'package:ebook/features/home/data/data_sources/home_remote.dart';
import 'package:ebook/features/home/domain/entities/book_entitiy.dart';
import 'package:ebook/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource,required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
        books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
        books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
