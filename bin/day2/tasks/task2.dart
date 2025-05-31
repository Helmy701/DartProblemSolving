import 'dart:io';

void main() {
  stdout.write("Enter scores (comma-separated): ");
  String? input = stdin.readLineSync();
  if (input != null) {
    Set<int> set = input
        .split(",")
        .map((e) => int.tryParse(e))
        .whereType<int>()
        .where((e) => e > 80)
        .toSet();
    print("Unique high scores: $set");
  }
}
