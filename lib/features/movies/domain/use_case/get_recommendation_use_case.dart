import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usw_case/base_use_case.dart';
import 'package:movies/features/movies/domain/entities/recommendation_entity.dart';
import 'package:movies/features/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<RecommendationEntity>, RecommendationParameter> {
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(RecommendationParameter parameters) async{
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}
// replace execute with => call
class RecommendationParameter extends Equatable{
  final int id;
  const RecommendationParameter(this.id);

  @override
  List<Object?> get props => [id];
}