import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movies/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movies/features/movies/domain/entities/movie_entity.dart';
import 'package:movies/features/movies/domain/entities/recommendation_entity.dart';
import 'package:movies/features/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/features/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_recommendation_use_case.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MoviesRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async{
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try{
      return right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async{
    final result = await baseMoviesRemoteDataSource.getPopularMovies();
    try{
      return right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async{
    final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
    try{
      return right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMoviesDetails(MovieDetailsParameters parameters) async {
    final result = await baseMoviesRemoteDataSource.getMoviesDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendation(RecommendationParameter parameters) async{
    final result = await baseMoviesRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}