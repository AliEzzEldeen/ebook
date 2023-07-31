part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBookLoading extends NewestBooksState {}

class NewestBookFailure extends NewestBooksState {
  final String errorMessage;

  NewestBookFailure(this.errorMessage);



}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);


}
