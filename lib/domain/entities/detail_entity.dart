import 'package:equatable/equatable.dart';
import 'package:movie_db/domain/entities/production_company_entity.dart';
import 'cast_entity.dart';
import 'crew_entity.dart';
import 'genre_entity.dart';
import 'movie_entity.dart';

class DetailEntity extends Equatable {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<GenreEntity> genres;
  final String homepage;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanyEntity> productionCompanies;
  final List<Map<String, dynamic>> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String title;
  final bool video;
  final double voteAverage;
  final List<CastEntity> cast;
  final List<CrewEntity> crew;
  final List<MovieEntity> recommendation;

  @override
  List<Object> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        title,
        video,
        voteAverage,
        cast,
        crew,
      ];

  const DetailEntity({
    required this.recommendation,
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.cast,
    required this.crew,
  });
}
