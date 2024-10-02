import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/features/movies/domain/entities/movie_entity.dart';
import 'package:movies/features/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<MovieEntity>>> execute() async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}