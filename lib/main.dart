import 'package:flutter/material.dart';

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
        primaryColor: Colors.deepPurple,
        colorScheme: const ColorScheme.highContrastDark(),
      ),
      home: const MyHomePage(title: 'PDF Lyrics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search Song"
              )
            ),
            Text("Hello")
          ],
        ),
      ),
    );
  }
}
