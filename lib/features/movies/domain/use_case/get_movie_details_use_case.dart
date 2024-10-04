import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usw_case/base_use_case.dart';
import 'package:movies/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movies/features/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters> {
  BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(MovieDetailsParameters parameters) async{
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }

}

class MovieDetailsParameters extends Equatable{
  final int movieId;
  const MovieDetailsParameters(this.movieId);

  @override
  List<Object?> get props => [movieId];
}