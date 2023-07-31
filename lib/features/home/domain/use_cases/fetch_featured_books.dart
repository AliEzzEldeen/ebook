import 'package:dartz/dartz.dart';
import 'package:ebook/features/home/domain/repos/home_repo.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/book_entitiy.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity> , NoParam>
{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async
  {
  return await homeRepo.fetchFeaturedBooks();

  }
}


