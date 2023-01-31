class MissingRequiredFieldsException implements Exception {
  String error() => "Song missing required fields";
}

class SongNotFoundException implements Exception {
  String error() => "Song not found";
}
