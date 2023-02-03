import 'package:flutter/material.dart';
import 'package:pdf_lyrics/models/error.dart';
import 'package:pdf_lyrics/models/song.dart';
import 'package:pdf_lyrics/provider/song_provider.dart';
import 'package:pdf_lyrics/widgets/error.dart';
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
  String _error = "";

  SongProvider songProvider = SongProvider();
  String searchTerm = "";

  void searchSong() async {
    setState(() {
      _isLoading = true;
      _error = "";
    });

    try {
      var response = await songProvider.searchSong(searchTerm);

      setState(() {
        _isLoading = false;
        _song = response;
      });
    } on SongNotFoundException {
      setState(() {
        _isLoading = false;
        _error = "Música não encontrada!";
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      setState(() {
        _isLoading = false;
        _error = "Algo deu errado!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 340),
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
                OutlinedButton(
                  onPressed: () {
                    searchSong();
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 58),
                    side: BorderSide(
                      color: Colors.grey[600]!
                    )
                  ),
                  child: const Icon(Icons.search),
                )
              ],
            ), // Row
          ), // Center
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: () {
                if (_isLoading) {
                  return const CircularProgressIndicator();
                }

                if (_error.isNotEmpty) {
                  return CustomErrorWidget(error: _error);
                }

                if (_song == null) {
                  return null;
                }

                return SongContainer(song: _song!);
              }()), // Container
        ]));
  }
}
