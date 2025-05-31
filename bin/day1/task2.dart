import 'dart:io';

// -------------- palindrome--------
void main() {
  while (true) {
    print("Enter a string or 0 to exit");
    String? value = stdin.readLineSync();

    if (value == "0") {
      print("Exiting...");
      break;
    }

    if (value != null) {
      String noWhitespace = value.replaceAll(RegExp(r'\s+'), '').toLowerCase();
      String reversing = noWhitespace.split("").reversed.join();
      String outPut = reversing == noWhitespace ? "true" : "false";
      print("\"$value\" is palindrome: $outPut");
    }
  }
}
