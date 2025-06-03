import 'dart:io';
import 'dart:async';

mixin WifiEnable {
  String networkName = "HomeNetwork";
  String ip = "192.168.1.101";

  Future<void> connectWifi() async {
    print("Connecting to $networkName...");
    await Future.delayed(Duration(seconds: 1));
    print("Connected. IP: $ip");
  }
}

mixin VoiceControl {
  void play(String music) {
    print("Playing: $music");
  }
}

class SmartLight with WifiEnable {
  Future<void> turnOn() async {
    await connectWifi();
    print("SmartLight is ON");
  }

  Future<void> turnOff() async {
    await connectWifi();
    print("SmartLight is OFF");
  }
}

class SmartSpeaker with WifiEnable, VoiceControl {
  Future<void> playMusic(String musicName) async {
    await connectWifi();
    play(musicName);
  }
}

Future<void> main() async {
  final smartLight = SmartLight();
  final smartSpeaker = SmartSpeaker();

  while (true) {
    stdout.write('Enter command (e.g., "light on", "speaker play Jazz"): ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      continue;
    }

    input = input.trim().toLowerCase();

    if (input == 'exit' || input == 'quit') {
      print("Goodbye!");
      break;
    }

    final parts = input.split(" ");
    if (parts.length < 2) {
      print("Invalid command. Try again.");
      continue;
    }

    final device = parts[0];
    final action = parts[1];
    final extra = parts.skip(2).join(" ");

    if (device == 'light') {
      if (action == 'on') {
        await smartLight.turnOn();
      } else if (action == 'off') {
        await smartLight.turnOff();
      } else {
        print("Unknown action for light: $action");
      }
    } else if (device == 'speaker') {
      if (action == 'play' && extra.isNotEmpty) {
        await smartSpeaker.playMusic(extra);
      } else {
        print("Usage: speaker play <song name>");
      }
    } else {
      print("Unknown device: $device");
    }
  }
}
