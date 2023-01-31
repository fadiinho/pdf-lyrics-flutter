import 'package:pdf_lyrics/models/error.dart';

class Song {
  String? name;
  String? lyrics;
  String? artist;
  Uri? url;

  Song(this.name, this.lyrics, this.artist, this.url);

  factory Song.fromJson(Map<String, dynamic> json) {
    String? name = json["songName"];
    String? artist = json["artist"];
    String? lyrics = json["lyrics"];
    String? url = json["url"];

    if (
      name == null ||
      artist == null ||
      lyrics == null ||
      url == null
    ) {
      throw MissingRequiredFieldsException();
    }

    return Song(name.trim(), lyrics, artist.trim(), Uri.parse(url));
  }
}
