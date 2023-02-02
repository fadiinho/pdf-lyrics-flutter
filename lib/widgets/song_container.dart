import 'package:flutter/material.dart';
import 'package:pdf_lyrics/models/song.dart';
import 'package:pdf_lyrics/widgets/song_info.dart';
import 'package:pdf_lyrics/widgets/song_lyrics.dart';

class SongContainer extends StatelessWidget {
  SongContainer({required this.song}) : super(key: ObjectKey(song.name));

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Column( children: <Widget>[
      SongInfo(name: song.name, artist: song.artist),
      SongLyrics(lyrics: song.lyrics)
    ]);
  }
}
