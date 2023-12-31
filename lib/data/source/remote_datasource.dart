// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/util/constants.dart';
import 'package:movie_db/data/models/detail_model.dart';
import 'package:movie_db/data/models/movie_model.dart';

abstract class DataSourceRepository {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<DetailModel> getDetail(int movieId);
  Future<DetailModel> getTest(int movieId);
}

class MovieRemoteDataSource extends DataSourceRepository {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      // Make HTTP GET request to fetch movie data
      final response = await Dio().get(Api.getNowPlayingUrl());

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse JSON response into a list of MovieModel objects
        final List<MovieModel> movies = List<MovieModel>.from(
            response.data['results'].map((json) => MovieModel.fromJson(json)));
        return movies;
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      // Handle DioError and map to Failure class
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      // Make HTTP GET request to fetch movie data
      final response = await Dio().get(Api.getTopRatedUrl());

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse JSON response into a list of MovieModel objects
        final List<MovieModel> movies = List<MovieModel>.from(
            response.data['results'].map((json) => MovieModel.fromJson(json)));
        return movies;
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      // Handle DioError and map to Failure class
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      // Make HTTP GET request to fetch movie data
      final response = await Dio().get(Api.getUpcomingUrl());

      // Check if response is successful
      if (response.statusCode == 200) {
        // Parse JSON response into a list of MovieModel objects
        final List<MovieModel> movies = List<MovieModel>.from(
            response.data['results'].map((json) => MovieModel.fromJson(json)));
        return movies;
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<DetailModel> getDetail(int movieId) async {
    final detailResponse = await Dio().get(Api.getDetailUrl(movieId));
    final creditsResponse = await Dio().get(Api.getCreditsUrl(movieId));
    final recommendationResponse =
        await Dio().get(Api.getRecommendationUrl(movieId));

    try {
      if (creditsResponse.statusCode == 200 &&
          detailResponse.statusCode == 200) {
        final creditsData = creditsResponse.data;
        final detailData = detailResponse.data;
        final List<MovieModel> movies = List<MovieModel>.from(
            recommendationResponse.data['results']
                .map((json) => MovieModel.fromJson(json)));
        return DetailModel.fromJson(
            detailData, creditsData['cast'], creditsData['crew'], movies);
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${detailResponse.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future<DetailModel> getTest(int movieId) async {
    final response = await Dio().get(Api.getTestUrl());
    final creditsResponse = await Dio().get(Api.getCreditsUrl(movieId));
    final recommendationResponse =
        await Dio().get(Api.getRecommendationUrl(movieId));
    try {
      if (creditsResponse.statusCode == 200 && response.statusCode == 200) {
        final creditsData = creditsResponse.data;
        final detailData = response.data;
        final List<MovieModel> movies = List<MovieModel>.from(
            recommendationResponse.data['results']
                .map((json) => MovieModel.fromJson(json)));
        return DetailModel.fromJson(
            detailData, creditsData['cast'], creditsData['crew'], movies);
      } else {
        throw ServerFailure(
            'Failed to fetch movies: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
