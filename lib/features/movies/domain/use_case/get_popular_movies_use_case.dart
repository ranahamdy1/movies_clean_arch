import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usw_case/base_use_case.dart';
import 'package:movies/features/movies/domain/entities/movie_entity.dart';
import 'package:movies/features/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntity>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async{
    return await baseMoviesRepository.getPopularMovies();
  }
}
// replace execute with => call