import 'package:get/get.dart';
import 'package:spring_boot_frontend/infrastructure/dal/model/review_model.dart';
import 'package:spring_boot_frontend/infrastructure/dal/services/movies_service.dart';
import 'package:spring_boot_frontend/infrastructure/dal/services/review_service.dart';
import '../../../infrastructure/dal/model/movies_model.dart';

class MovieDetailsController extends GetxController {
  final ReviewService reviewService = ReviewService();
  final MovieService movieService = MovieService();
  Rx<Movie?> selectedMovie = Rx<Movie?>(null);
  var reviews = <Review>[].obs;

  @override
  void onInit() {
    // fetchReviews();
    super.onInit();
  }

  void selectMovie(Movie movie) {
    selectedMovie.value = movie;
  }

  // Future<void> fetchReviews() async {
  //   try {
  //     if (selectedMovie.value != null) {
  //       final fetchedReviews =
  //           await movieService.fetchReview(selectedMovie.value!.imdbId);

  //       // Assuming movies have a `reviews` property containing reviews
  //       if (fetchedReviews is List<Movie>) {
  //         reviews.assignAll(fetchedReviews
  //             .map((movie) => movie.reviewIds.map((e) => e.body))
  //             .toList());
  //       } else {
  //         reviews
  //             .assignAll(fetchedReviews as List<Review>); // Cast if compatible
  //       }

  //       // Update reviews after fetching (assuming fetched data contains reviews)
  //       updateReviews(); // This is the new function to iterate through reviews
  //     } else {
  //       reviews.clear(); // Clear reviews if no movie is selected
  //     }
  //   } catch (e) {
  //     print('Failed to fetch reviews: $e');
  //   } finally {
  //     update(); // Update UI after fetching reviews (optional)
  //   }
  // }

  void updateReviews() {
    // This function iterates through the fetched reviews (stored in 'reviews')
    for (final review in reviews) {
      // Assuming 'review' is a Review object, access its properties here
      print(review.body); // Example: print the review content
    }
  }

  void addReview(Review review) {
    reviews.add(review);
    update();
  }
}
