import 'package:flutter/material.dart';
import 'package:pdf_lyrics/models/error.dart';
import 'package:pdf_lyrics/models/song.dart';
import 'package:pdf_lyrics/provider/song_provider.dart';
import 'package:pdf_lyrics/widgets/song_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Song? _song;
  bool _isLoading = false;

  SongProvider songProvider = SongProvider();
  String searchTerm = "";

  void searchSong() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var response = await songProvider.searchSong(searchTerm);

      setState(() {
        _isLoading = false;
        _song = response;
      });

    } on SongNotFoundException {
      // TODO: Show error for the user
      // ignore: avoid_print
      print("Song not found!");

      setState(() {
        _isLoading = false;
      });
    }
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
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Search Song",
                  ),
                  onChanged: (String value) {
                    searchTerm = value;
                  },
                  onSubmitted: (String value) {
                    searchSong();
                  },
                ),
              ),
            ),
            Container(child: () {
              if (_isLoading) {
                return const CircularProgressIndicator();
              }

              if (_song == null) {
                return null;
              }

              return SongContainer(song: _song!);
            }())
          ],
        ),
      ),
    );
  }
}
