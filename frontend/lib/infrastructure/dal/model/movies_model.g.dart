// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as Map<String, dynamic>,
      imdbId: json['imdbId'] as String,
      title: json['title'] as String,
      releaseDate: json['releaseDate'] as String,
      trailerLink: json['trailerLink'] as String,
      poster: json['poster'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      backdrops:
          (json['backdrops'] as List<dynamic>).map((e) => e as String).toList(),
      reviewIds: (json['reviewIds'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'imdbId': instance.imdbId,
      'title': instance.title,
      'releaseDate': instance.releaseDate,
      'trailerLink': instance.trailerLink,
      'poster': instance.poster,
      'genres': instance.genres,
      'backdrops': instance.backdrops,
      'reviewIds': instance.reviewIds,
    };
