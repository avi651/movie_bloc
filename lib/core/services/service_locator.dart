import 'package:get_it/get_it.dart';
import 'package:movie_db/bloc/movie_bloc.dart';
import 'package:movie_db/data/repository/base_repository_impl.dart';
import 'package:movie_db/data/source/remote_datasource.dart';
import 'package:movie_db/domain/repository/base_repository.dart';
import 'package:movie_db/domain/usecase/get_details_usecase.dart';
import 'package:movie_db/domain/usecase/get_top_rated_usecase.dart';
import 'package:movie_db/domain/usecase/get_upcoming_usecase.dart';
import 'package:movie_db/domain/usecase/now_playing_usecase.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton<DataSourceRepository>(
        () => MovieRemoteDataSource());

    getIt.registerLazySingleton<BaseRepository>(
        () => BaseRepositoryImpl(getIt()));

    getIt.registerLazySingleton(() => GetNowPlyingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUpcomingUseCase(getIt()));
    getIt.registerLazySingleton(() => GetDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTest((getIt())));

    getIt
        .registerFactory<MovieBloc>(() => MovieBloc(getIt(), getIt(), getIt()));
  }
}
