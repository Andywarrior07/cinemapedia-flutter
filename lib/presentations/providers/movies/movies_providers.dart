import 'package:cinemapedia/presentations/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentations/domain/entities/movie.dart';

typedef MovieCallback = Future<List<Movie>> Function({int page});

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 1;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];

    currentPage++;
  }
}
