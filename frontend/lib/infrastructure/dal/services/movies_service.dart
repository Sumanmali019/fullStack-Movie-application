import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/movies_model.dart';

class MovieService {
  final String baseUrl = 'http://192.168.0.103:8081/api/v1/movies';

  Future<List<Movie>> fetchMovies() async {
    try {
      // Define headers
      Map<String, String> headers = {"Content-Type": "application/json"};

      // Make HTTP request with headers
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonMovies = json.decode(response.body);
        final List<Movie> movies =
            jsonMovies.map((json) => Movie.fromJson(json)).toList();
        print('____________Fetched Movies: ${movies.map((e) => e.title)}');
        return movies;
      } else {
        throw Exception(
            'Failed to fetch movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  Future<List<Movie>> fetchReview(String imdbId) async {
    try {
      // Define headers
      Map<String, String> headers = {"Content-Type": "application/json"};

      // Make HTTP request with headers
      final response = await http.get(
        Uri.parse('$baseUrl/reviews?imdbId=$imdbId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonMovies = json.decode(response.body);
        final List<Movie> movies =
            jsonMovies.map((json) => Movie.fromJson(json)).toList();
        print('____________Fetched Reviews: ${movies.map((e) => e.title)}');
        return movies;
      } else {
        throw Exception(
            'Failed to fetch reviews. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching reviews: $e');
    }
  }
}
