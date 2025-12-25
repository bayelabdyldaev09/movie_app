// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
  id: json['id'] as String?,
  title: json['title'] as String?,
  poster: json['poster'] as String?,
  voteAv: json['voteAv'] as String?,
);

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'poster': instance.poster,
  'voteAv': instance.voteAv,
};
