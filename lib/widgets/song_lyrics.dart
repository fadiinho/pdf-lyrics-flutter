import 'package:flutter/material.dart';

class SongLyrics extends StatelessWidget {
  SongLyrics({required this.lyrics}) : super(key: UniqueKey());

  final String lyrics;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Text(lyrics));
  }
}
