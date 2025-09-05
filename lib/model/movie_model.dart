class Movie {
  final String title;
  final String director;
  final int year;
  final String genre;

  Movie({
    required this.title,
    required this.director,
    required this.year,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      director: json['director'],
      year: json['year'],
      genre: json['genre'],
    );
  }
}
