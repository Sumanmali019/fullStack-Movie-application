import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spring_boot_frontend/infrastructure/dal/model/movies_model.dart';

import '../movie_details/controllers/movie_details.controller.dart';
import '../movie_details/movie_details.screen.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;

  final MovieDetailsController? controller;
  const MovieListTile({super.key, required this.movie, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: () {
            controller?.selectMovie(movie); // Select the movie
            Get.to(MovieDetailsScreen()); // Navigate to MovieDetailsScreen
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(movie.poster),
                    radius: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: movie.genres.map((genre) {
                  return Chip(
                    label: Text(genre),
                    backgroundColor: Colors.blue,
                    labelStyle: const TextStyle(color: Colors.white),
                  );
                }).toList(),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       for (var review in movie.reviewIds)
              //         Text(
              //           review.body,
              //           style: const TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       if (movie.reviewIds.isEmpty)
              //         const Text(
              //           'No reviews available',
              //           style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}
