import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_provider.dart';

class MovieDetailScreen extends StatelessWidget {
  final String imdbID;

  MovieDetailScreen({required this.imdbID});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);

    // Fetch movie details when the screen opens
    searchProvider.fetchMovieDetails(imdbID);

    return Scaffold(
      appBar: AppBar(title: Text('Movie Details')),
      body: Consumer<SearchProvider>(
        builder: (context, provider, child) {
          final details = provider.movieDetails;
          if (details.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(details['Title'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Year: ${details['Year']}'),
                Text('Genre: ${details['Genre']}'),
                Text('Director: ${details['Director']}'),
                Text('Plot: ${details['Plot']}'),
                SizedBox(height: 10),
                Image.network(
                  details['Poster'] ?? '',
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.movie),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
