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
  bool _isLoadingMore = false;

  final ScrollController _scrollController = ScrollController();

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
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            if (index < movies.length) {
              final movie = movies[index];
              return MovieItem(movie: movie);
            } else {
              return _isLoadingMore
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    Provider.of<MovieProvider>(context, listen: false).fetchMovies(1);
  }

  Future<void> _loadMoreMovies() async {
    setState(() {
      _isLoadingMore = true;
    });

    final pageNumber =
        Provider.of<MovieProvider>(context, listen: false).movies.length ~/ 20 +
            1;
    await Provider.of<MovieProvider>(context, listen: false)
        .fetchMovies(pageNumber);

    setState(() {
      _isLoadingMore = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        !_isLoadingMore) {
      _loadMoreMovies();
    }
  }
}
