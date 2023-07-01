import 'package:dartz/dartz.dart';
import 'package:ebook/features/home/domain/repos/home_repo.dart';
import '../../../../core/error/failure.dart';
import '../entities/book_entitiy.dart';
import 'fetch_featured_books.dart';

class NewestBooksUseCase extends UseCase<List<BookEntity> , NoParam>
{
  final HomeRepo homeRepo;

  NewestBooksUseCase(this.homeRepo);



  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async
  {
    return await homeRepo.fetchNewestBooks();
  }
}

