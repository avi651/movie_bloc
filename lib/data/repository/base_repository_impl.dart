import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/data/source/remote_datasource.dart';
import 'package:movie_db/domain/entities/detail_entity.dart';
import 'package:movie_db/domain/entities/movie_entity.dart';
import 'package:movie_db/domain/repository/base_repository.dart';

class BaseRepositoryImpl extends BaseRepository {
  DataSourceRepository dataSourceRepository;

  BaseRepositoryImpl(this.dataSourceRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await dataSourceRepository.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await dataSourceRepository.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpcomingMovies() async {
    final result = await dataSourceRepository.getUpcomingMovies();
    try {
      return Right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, DetailEntity>> getDetails(int movieId) async {
    final result = await dataSourceRepository.getDetail(movieId);
    try {
      return right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, DetailEntity>> getTest() async {
    final result = await dataSourceRepository.getTest(00);
    try {
      return right(result);
    } on ServerFailure catch (failure) {
      return left(failure);
    }
  }
}
