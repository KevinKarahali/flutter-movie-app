import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/actors_model.dart';
import '../models/movies_model.dart';

class MoviesProvider {
  final String _apiKey = '428a586101b2201a77ef8fa9e98c090f';
  final String _url = 'api.themoviedb.org';

  int _popularPage = 0;
  bool _loading = false;

  List<Movie> _popular = [];

  final _popularStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularStreamController.sink.add;

  Stream<List<Movie>> get popularStream => _popularStreamController.stream;

  void disposeStreams() {
    _popularStreamController.close();
  }

  Future<List<Movie>> _processResponse(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getMoviesCinema() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
    });
    return await _processResponse(url);
  }

  Future<List<Movie>> getPopularMovies() async {
    if (_loading) return [];

    _loading = true;

    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular',
        {'api_key': _apiKey, 'page': _popularPage.toString()});

    final resp = await _processResponse(url);

    _popular.addAll(resp);
    popularSink(_popular);
    _loading = false;
    return resp;
  }

  Future<List<Actor>> getCast(String movieId) async {
    final url = Uri.https(_url, '3/movie/$movieId/credits', {
      'api_key': _apiKey,
    });
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final cast = Cast.fromJsonList(decodedData['cast']);
    return cast.actors;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url =
        Uri.https(_url, '3/search/movie', {'api_key': _apiKey, 'query': query});
    return await _processResponse(url);
  }
}
