import 'package:movies/features/movies/domain/entities/movie_entity.dart';

class MoviesModel extends MovieEntity {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.backDropPath,
    required super.genreId,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate
  });
  factory MoviesModel.fromJson(Map<String, dynamic>json) =>
      MoviesModel(
        id: json["id"],
        title: json["title"],
        backDropPath: json["backdrop_path"],
        genreId: List<int>.from(json["genre_ids"].map((e) => e)),
        overView: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"],
      );
}