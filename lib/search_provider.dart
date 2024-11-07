// search_provider.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchProvider with ChangeNotifier {
  List _results = [];
  Map<String, dynamic> _movieDetails = {};

  List get results => _results;
  Map<String, dynamic> get movieDetails => _movieDetails;

  // Search for movies by title
  Future<void> searchMovies(String query) async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=29b64f14&s=$query');
    final response = await http.get(url);
    print("http://www.omdbapi.com/?apikey=29b64f14&s=$query");
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      _results = data['Search'] ?? [];
      notifyListeners();
    }
  }

  // Fetch movie details by IMDb ID
  Future<void> fetchMovieDetails(String imdbID) async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=29b64f14&i=$imdbID');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      _movieDetails = json.decode(response.body);
      notifyListeners();
    }
  }
}
