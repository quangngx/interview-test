import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'movie.dart';



class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<void> fetchMovies() async {
    final url = Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=26763d7bf2e94098192e629eb975dab0&page=1');
    final response = await http.get(url);

    final data = json.decode(response.body)['results'];

    final List<Movie> loadedMovies = [];

    for (var i = 0; i < data.length; i++) {
      loadedMovies.add(Movie.fromJson(data[i]));
    }

    _movies = loadedMovies;

    notifyListeners();
  }
}