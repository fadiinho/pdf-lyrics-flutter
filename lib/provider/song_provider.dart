import "dart:convert";

import "package:http/http.dart" as http;
import "package:pdf_lyrics/models/error.dart";
import "package:pdf_lyrics/models/song.dart";

const songApi = "https://lyrics-api-gvem.onrender.com";

class SongProvider {
  Future<Song> searchSong(String searchTerm) async {
    var response = await http.get(Uri.parse("$songApi/search/title/$searchTerm"));
    var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (!jsonResponse["ok"]) {
      throw Exception("Song not found");
    }

    List<dynamic> data = jsonResponse["data"];

    for (var rawSong in data) {
      try {
        return Song.fromJson(rawSong);
      } on MissingRequiredFieldsException {
        // We should ignore it
      }
    }

    throw SongNotFoundException();
  }
}
