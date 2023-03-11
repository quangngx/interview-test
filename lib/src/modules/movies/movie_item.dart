import 'package:flutter/material.dart';

import '../../data/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.amber,
        image: DecorationImage(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500/${movie.posterUrl}'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
                child: Text(movie.vote.toString()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              movie.releaseDate.toString().substring(0, 4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title.toString().toUpperCase(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
