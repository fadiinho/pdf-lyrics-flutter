import 'package:flutter/material.dart';
import 'package:pdf_lyrics/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Lyrics',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurple[600]!,
          background: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple[600]!,
        ),
        scaffoldBackgroundColor: Colors.black.withOpacity(0.95)
      ),
      home: const HomePage(title: 'PDF Lyrics'),
    );
  }
}
