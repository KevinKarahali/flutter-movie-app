import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/movies_model.dart';

class MoviesProvider {
  final String _apiKey = '428a586101b2201a77ef8fa9e98c090f';
  final String _url = 'api.themoviedb.org';


Future<List<Movie>> getPopular() async {
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

}