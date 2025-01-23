import 'package:just_audio/just_audio.dart';

class AudioPlayerUtils {
  static final player = AudioPlayer();

  static Future<void> play(String url) async {
    await player.setUrl(url);
    await player.play();
    await player.stop();
  }
}
