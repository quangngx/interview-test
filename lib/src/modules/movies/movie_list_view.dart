import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/movie_provider.dart';
import 'movie_item.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context).movies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            final movie = movies[index];
            return MovieItem(movie: movie);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).fetchMovies();
  }
}
