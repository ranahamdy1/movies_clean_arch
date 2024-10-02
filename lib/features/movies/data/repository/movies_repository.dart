import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movies/features/movies/domain/entities/movie_entity.dart';
import 'package:movies/features/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

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
}