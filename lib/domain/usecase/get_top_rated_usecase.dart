import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/domain/repository/base_repository.dart';

class GetTopRatedUseCase {
  BaseRepository baseRepository;

  GetTopRatedUseCase(this.baseRepository);
  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseRepository.getTopRatedMovies();
  }
}
