import 'package:flutter/material.dart';
import 'package:pdf_lyrics/models/song.dart';
import 'package:pdf_lyrics/provider/song_provider.dart';

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

class SongInfo extends StatelessWidget {
  SongInfo({
    required this.name,
    required this.artist,
    required this.url,
  }) : super(key: ObjectKey(name));

  final String name;
  final String artist;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Text(name),
          Text(artist),
          Text(url.toString()),
      ]
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
  Song? _song;

  SongProvider songProvider = SongProvider();
  String searchTerm = "";

  void searchSong() async {
    var response = await songProvider.searchSong(searchTerm);
    setState(() {
      _song = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Search Song",
                ),
                onChanged: (String value) {
                  searchTerm = value;
                },
                onSubmitted: (String value) { searchSong(); },
              ),
            ),
            Container(child: () {
                if (_song == null) {
                  return null;
                }

                return SongInfo(
                  name: _song?.name as String,
                  artist: _song?.artist as String,
                  url: _song?.url as Uri);
              }()
            )
          ],
        ),
      ),
    );
  }
}
