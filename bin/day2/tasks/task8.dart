import 'dart:developer';
import 'dart:io';

class UnsupportedMediaError implements Exception {
  final String mediaType;
  UnsupportedMediaError(this.mediaType);

  @override
  String toString() =>
      'Error: No suitable component available for type: $mediaType';
}

class UnsupportedFileError implements Exception {
  final String mediaFile;
  UnsupportedFileError(this.mediaFile);

  @override
  String toString() =>
      'Error: No suitable component available for type: $mediaFile';
}

class AudioComponent {
  String? file;
  void play(String file) {
    if (this.file != null) {
      print(
        'VideoComponent: U should stoped playing video befor play another one',
      );
    } else {
      print('AudioComponent: Playing audio file: $file');
      this.file = file;
    }
  }

  void stop() {
    if (file != null) {
      print('AudioComponent: Stopping audio playback.');
      file = null;
    } else {
      print('AudioComponent: there is no file to stop');
    }
  }
}

class VideoComponent {
  String? file;
  void play(String file) {
    if (this.file != null) {
      print(
        'VideoComponent: U should stoped playing video befor play another one',
      );
    } else {
      print('VideoComponent: Playing video file: $file');
      this.file = file;
    }
  }

  void stop() {
    if (file != null) {
      print('VideoComponent: Stopping video playback.');
      file = null;
    } else {
      print('VideoComponent: there is no file to stop');
    }
  }
}

class MediaPlayer {
  VideoComponent videoComponent = VideoComponent();
  AudioComponent audioComponent = AudioComponent();
  playMedia(String type, String file) {
    if (type == "audio" && file.endsWith(".mp3")) {
      audioComponent.play(file);
    } else if (type == "video" && file.endsWith(".mp4")) {
      videoComponent.play(file);
    } else if (type != "audio" && type != "video") {
      throw UnsupportedMediaError(type);
    } else {
      throw UnsupportedFileError(file);
    }
  }

  stopMedia() {
    audioComponent.stop();
    videoComponent.stop();
  }
}

void main() {
  MediaPlayer mediaPlayer = MediaPlayer();
  while (true) {
    print("Enter media type (audio/video), file or stop to Stop all medias:");
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      if (input == "stop") {
        mediaPlayer.stopMedia();
      } else if (input.contains(",") && input.split(",").length == 2) {
        String type = input.split(",")[0].trim();
        String file = input.split(",")[1].trim();
        try {
          mediaPlayer.playMedia(type, file);
        } on UnsupportedMediaError catch (e) {
          print(e);
        } on UnsupportedFileError catch (e) {
          print(e);
        }
      }
    } else {
      print("you should enter value");
    }
  }
}
