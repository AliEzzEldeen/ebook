import 'package:bloc/bloc.dart';
import 'package:ebook/features/home/domain/use_cases/fetch_featured_books.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/book_entitiy.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await featuredBooksUseCase.call();

    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
