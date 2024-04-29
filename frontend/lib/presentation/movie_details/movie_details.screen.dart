import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:spring_boot_frontend/infrastructure/dal/services/review_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../infrastructure/dal/model/movies_model.dart';
import 'controllers/movie_details.controller.dart';

class MovieDetailsScreen extends GetView<MovieDetailsController> {
  final ReviewService reviewService =
      ReviewService(); // Instantiate ReviewService
  final TextEditingController reviewController = TextEditingController();

  MovieDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Movie? selectedMovie = controller.selectedMovie.value;
    // // Fetch reviews when the screen is initialized
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller.fetchReviews();
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMovie?.title ?? 'Movie Details'),
        centerTitle: true,
      ),
      body: selectedMovie != null
          ? ListView(
              padding: const EdgeInsets.only(top: 16.0),
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedMovie.backdrops.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(selectedMovie.backdrops[index]),
                      );
                    },
                  ),
                ),

                // Display YouTube trailer
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(
                              selectedMovie.trailerLink) ??
                          '',
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blue,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.blue,
                      handleColor: Colors.blueAccent,
                    ),
                  ),
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                      ],
                    );
                  },
                ),

                // Review Text Form
                TextField(
                  controller: reviewController,
                  decoration:
                      const InputDecoration(labelText: 'Write a review'),
                ),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    _submitReview(selectedMovie.imdbId);
                  },
                  child: const Text('Submit'),
                ),

                // Display Reviews
                Obx(
                  () {
                    if (controller.reviews.isEmpty) {
                      return const Center(child: Text('No reviews available'));
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Reviews:'),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.reviews.length,
                            itemBuilder: (context, index) {
                              final review = controller.reviews[index];
                              return ListTile(
                                title: Text(review.body),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  },
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  void _submitReview(String imdbId) async {
    final reviewBody = reviewController.text;
    if (reviewBody.isNotEmpty) {
      try {
        final newReview = await reviewService.submitReview(imdbId, reviewBody);
        controller.addReview(newReview);
        reviewController.clear();
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to submit review: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
