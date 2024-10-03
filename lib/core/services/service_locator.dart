import 'package:get_it/get_it.dart';
import 'package:movies/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movies/features/movies/data/repository/movies_repository.dart';
import 'package:movies/features/movies/domain/repository/base_movies_repository.dart';
import 'package:movies/features/movies/domain/use_case/get_now_playing_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:movies/features/movies/presentation/controller/movies/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// BLOC
    sl.registerFactory(()=> MoviesBloc(sl(), sl(), sl()));

    /// USE CASE
    sl.registerLazySingleton(()=> GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(()=> GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(()=> GetTopRatedMoviesUseCase(sl()));

    /// REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(()=> MoviesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MovieRemoteDataSource());
  }
}