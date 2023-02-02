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
      title: 'Flutter Demo',
      theme: ThemeData(
        ),
      ),
      home: const HomePage(title: 'PDF Lyrics'),
    );
  }
}
