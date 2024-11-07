import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_provider.dart';
import 'movie_search_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieSearchScreen(),
    );
  }
}
