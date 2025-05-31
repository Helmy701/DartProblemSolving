import 'dart:io';

void main() {
  stdout.write("Enter names (comma-separated): ");
  String? input = stdin.readLineSync();
  if (input != null) {
    List<String> names = input
        .split(",")
        .map((n) => n[0].toUpperCase() + n.substring(1).toLowerCase())
        .toList();
    print("Capitalized: $names");

    List<String> startA = names.where((n) => n[0] == "A").toList();
    print("Names starting with A: $startA");
  }
}
