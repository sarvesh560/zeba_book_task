import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/movie_model.dart';

class MovieService {
  Future<List<Movie>> loadMovies() async {
    final String response = await rootBundle.loadString('assets/movies.json');
    final List<dynamic> data = json.decode(response);
    return data.map((e) => Movie.fromJson(e)).toList();
  }
}
