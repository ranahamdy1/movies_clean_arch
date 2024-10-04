import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movies/features/movies/domain/entities/recommendation_entity.dart';
import 'package:movies/features/movies/domain/use_case/get_movie_details_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_recommendation_use_case.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
      this.getMovieDetailsUseCase,
      this.getRecommendationUseCase
      ): super(const MovieDetailsState()) {

    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getMovieDetailsUseCase(MovieDetailsParameters(event.id));
    result.fold(
            (l) => emit(state.copyWith(movieDetailsState: RequestState.error,movieDetailsMessage: l.message)),
            (r) => emit(state.copyWith(movieDetailsState: RequestState.loaded,movieDetail: r)),
    );
  }

  FutureOr<void> _getRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(RecommendationParameter(event.id));
    result.fold(
            (l) => emit(state.copyWith(recommendationState: RequestState.error,recommendationMessage: l.message)),
            (r) => emit(state.copyWith(recommendationState: RequestState.loaded,recommendation: r)),
    );
  }
}
