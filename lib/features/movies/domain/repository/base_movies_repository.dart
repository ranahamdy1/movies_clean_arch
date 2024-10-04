import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movies/features/movies/domain/entities/movie_entity.dart';
import 'package:movies/features/movies/domain/entities/recommendation_entity.dart';
import 'package:movies/features/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_recommendation_use_case.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetailsEntity>> getMoviesDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendation(RecommendationParameter parameters);
}