import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  final int id;
  final String title;
  final String releaseDate;
  final String posterUrl;
  final double vote;

  Movie(
      {required this.id,
      required this.title,
      required this.releaseDate,
      required this.posterUrl,
      required this.vote});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json["id"],
        title: json["title"],
        releaseDate: json["release_date"],
        posterUrl: 'https://image.tmdb.org/t/p/w500${json["poster_path"]}',
        vote: json["vote_average"].toDouble());
  }
}
