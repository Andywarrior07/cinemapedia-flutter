import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentations/providers/providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayerMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayerMovies.isEmpty) return [];

  return nowPlayerMovies.sublist(0, 5);
});
