import 'package:cinemapedia/presentations/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

typedef GetMovieCallback = Future<Movie> Function(String movieId);

final movieDetailProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(moviesRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
