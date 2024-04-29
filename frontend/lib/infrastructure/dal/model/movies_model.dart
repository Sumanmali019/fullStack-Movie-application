import 'package:json_annotation/json_annotation.dart';
import 'package:spring_boot_frontend/infrastructure/dal/model/review_model.dart';

part 'movies_model.g.dart';

@JsonSerializable()
class Movie {
  final Map<String, dynamic> id;
  final String imdbId;
  final String title;
  final String releaseDate;
  final String trailerLink;
  final String poster;
  final List<String> genres;
  final List<String> backdrops;
  final List<Review> reviewIds;

  Movie({
    required this.id,
    required this.imdbId,
    required this.title,
    required this.releaseDate,
    required this.trailerLink,
    required this.poster,
    required this.genres,
    required this.backdrops,
    required this.reviewIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
