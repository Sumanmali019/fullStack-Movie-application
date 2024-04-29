import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/review_model.dart';

class ReviewService {
  final String baseUrl =
      'http://192.168.0.103:8081/api/v1/review'; // Adjust if needed

  Future<Review> submitReview(String imdbId, String reviewBody) async {
    final body = jsonEncode({'reviewBody': reviewBody, 'imdbId': imdbId});
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonReview = json.decode(response.body);
      return Review.fromJson(jsonReview);
    } else {
      throw Exception(
          'Failed to submit review. Status code: ${response.statusCode}');
    }
  }
}
