import 'package:get/get.dart';
import '../model/movie_model.dart';
import '../services/movie_service.dart';

class MovieController extends GetxController {
  final MovieService _service = MovieService();

  var movies = <Movie>[].obs;
  var filteredMovies = <Movie>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var result = await _service.loadMovies();
      movies.assignAll(result);
      filteredMovies.assignAll(result);
    } finally {
      isLoading(false);
    }
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      filteredMovies.assignAll(movies);
    } else {
      filteredMovies.assignAll(
        movies.where((movie) =>
            movie.title.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }
}
