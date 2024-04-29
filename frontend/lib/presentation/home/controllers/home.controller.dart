import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/dal/model/movies_model.dart';
import '../../../infrastructure/dal/services/movies_service.dart';

class HomeController extends GetxController {
  final MovieService _movieService = MovieService();
  final RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      final List<Movie> fetchedMovies = await _movieService.fetchMovies();
      movies.assignAll(fetchedMovies);
    } catch (e) {
      print('$e');
      Get.snackbar(
        'Error',
        'Failed to fetch movies.',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
