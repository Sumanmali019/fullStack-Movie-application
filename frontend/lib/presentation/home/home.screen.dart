import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_boot_frontend/presentation/home/controllers/home.controller.dart';
import 'package:spring_boot_frontend/presentation/home/show_movie.dart';
import 'package:spring_boot_frontend/presentation/movie_details/controllers/movie_details.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(left: 9),
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final movie = controller.movies[index];
                return MovieListTile(
                  movie: movie,
                  controller: Get.find<MovieDetailsController>(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
