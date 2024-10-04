import 'package:movies/features/movies/domain/entities/generes_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({
    required super.name,
    required super.id,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
    id: json["id"],
    name: json["name"],
  );
}