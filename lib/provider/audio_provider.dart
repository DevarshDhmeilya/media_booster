import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class AdProvider extends ChangeNotifier {
  static AssetsAudioPlayer myPlayer = AssetsAudioPlayer();

  open() async {
    await myPlayer.open(
      Audio.network(
        "https://samplelib.com/lib/preview/mp3/sample-12s.mp3",
      ),
      autoStart: false,
    );
  }

  playSong() async {
    await myPlayer.play();
    notifyListeners();
  }

  pauseSong() async {
    await myPlayer.pause();
    notifyListeners();
  }

  stopSong() async {
    await myPlayer.stop();
  }

  seekSong(int second) async {
    await myPlayer.seekBy(Duration(seconds: second));
  }
}
