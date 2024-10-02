import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backDropPath;
  final List<int> genreId;
  final String overView;
  final double voteAverage;
  final int releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.genreId,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate
  });

  @override
  List<Object> get props =>
      [id, title, backDropPath, genreId, overView, voteAverage, releaseDate];
}