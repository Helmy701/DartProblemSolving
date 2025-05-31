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
}

class SmartSpeaker with WifiEnable, VoiceControl {
  Future<void> turnOn(String musicName) async {
    await connectWifi();
    play(musicName);
  }
}

void main() {}
