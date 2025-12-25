import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies {
  const Movies({this.id, this.title, this.poster, this.voteAv});

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  final String? id;
  final String? title;
  final String? poster;
  final String? voteAv;

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}