import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/features/movies/domain/entities/movie_entity.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<MovieEntity> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<MovieEntity> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const[],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',

    this.popularMovies = const[],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

    this.topRatedMovies = const[],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = ''
  });

  MoviesState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,

    List<MovieEntity>? popularMovies,
    RequestState? popularState,
    String? popularMessage,

    List<MovieEntity>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,

        popularMovies,
        popularState,
        popularMessage,

        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];
}