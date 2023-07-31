import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/book_entitiy.dart';
import '../../../domain/use_cases/fetch_newest_books.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());


  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBookFailure(failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }

}
