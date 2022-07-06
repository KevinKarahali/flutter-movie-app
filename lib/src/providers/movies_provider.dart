import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/movies_model.dart';

class MoviesProvider {
  final String _apiKey = '428a586101b2201a77ef8fa9e98c090f';
  final String _url = 'api.themoviedb.org';

  Future<List<Movie>> _processResponse(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getMovies() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
    });
    return await _processResponse(url);
  }

  Future<List<Movie>> getPopularMovies() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
    });
    return await _processResponse(url);
  }
}
