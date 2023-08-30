import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/domain/entities/detail_entity.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies();
  Future<Either<Failure, DetailEntity>> getDetails(int movieId);
  Future<Either<Failure, DetailEntity>> getTest();
}
