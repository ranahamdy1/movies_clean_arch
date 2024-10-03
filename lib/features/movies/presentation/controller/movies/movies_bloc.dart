import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/features/movies/domain/use_case/get_now_playing_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movies/features/movies/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:movies/features/movies/presentation/controller/movies/movies_event.dart';
import 'package:movies/features/movies/presentation/controller/movies/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
      this.getNowPlayingUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase
      ):super(const MoviesState()){

    on<GetNowPlayingEvent>(_getNowPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);

  }

  //replace getNowPlayingUseCase.execute(); with getNowPlayingUseCase();
  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingEvent event, Emitter<MoviesState> emit) async{
    final result = await getNowPlayingUseCase();
    result.fold(
            (l) => emit(state.copyWith(nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
            (r)=> emit(state.copyWith(nowPlayingMovies: r, nowPlayingState: RequestState.loaded))
    );
  }

  FutureOr<void> _getPopularMovies(
    GetPopularEvent event, Emitter<MoviesState> emit) async{
    final result = await getPopularMoviesUseCase();
    result.fold(
            (l) => emit(state.copyWith(popularState: RequestState.error, nowPlayingMessage: l.message)),
            (r)=> emit(state.copyWith(popularMovies: r, popularState: RequestState.loaded))
    );
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase();
    result.fold(
            (l) => emit(MoviesState(topRatedState: RequestState.error, topRatedMessage: l.message)),
            (r)=> emit(MoviesState(topRatedMovies: r, topRatedState: RequestState.loaded))
    );
  }
}