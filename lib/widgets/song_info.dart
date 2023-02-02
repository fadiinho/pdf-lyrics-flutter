import 'package:flutter/material.dart';

class SongInfo extends StatelessWidget {
  SongInfo({
    required this.name,
    required this.artist
  }) : super(key: ObjectKey(name));

  final String name;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('$artist - $name'),
    ]);
  }
}
