import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/datasources/isar_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/local_storage_impl.dart';

final localStorageProvider =
    Provider((ref) => LocalStorageRepositoryImpl(IsarDatasource()));

final isFavoriteProvider =
    FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorage = ref.watch(localStorageProvider);

  return localStorage.isMovieFavorite(movieId);
});
