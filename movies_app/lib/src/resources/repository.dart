import 'dart:async';
import 'movie_api_provider.dart';
import 'package:movies_app/src/models/item_model.dart';

class Repository{
  final moviesApiProvider = MoviesApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

}