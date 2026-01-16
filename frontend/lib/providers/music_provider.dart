import 'package:flutter/cupertino.dart';

class MusicProvider with ChangeNotifier {
  bool _isPlaying = false;
  int _progress = 0;
  String _currentSong = "노래 1";

  // getter들...
  bool get isPlaying => _isPlaying;
  int get progress => _progress;
  String get currentSong => _currentSong;

  void togglePlay() {
    if(!_isPlaying){
      _isPlaying = true;
    } else {
      _isPlaying = false;
    }
    notifyListeners();
  }

  void nextSong() {
    _progress += 1;
    _currentSong = "노래 ${1 + _progress}";
    notifyListeners();
  }

  void previousSong() {
    _progress -= 1;
    _currentSong = "노래 ${1 - _progress}";
    notifyListeners();
  }
  void updateProgress(int value) {

  }
}
