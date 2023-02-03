import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_lyrics/screens/home.dart';
import 'package:permission_handler/permission_handler.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void requestPermissions() async {
    if (await Permission.storage.isGranted) {
      return;
    }

    var status = await Permission.storage.request();

    if (status.isPermanentlyDenied) {
      openAppSettings();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      requestPermissions();
    }

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
