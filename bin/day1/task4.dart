import 'dart:io';

void main() {
  while (true) {
    String? firstName;
    do {
      print("Enter first name (or 0 to quit): ");
      firstName = stdin.readLineSync();
      if (firstName == "") {
        print("please Enter value");
      } else {
        break;
      }
    } while (true);

    if (firstName == "0") break;

    print("Enter last name (optional, press Enter to skip): ");
    String? lastName = stdin.readLineSync();

    print("Enter title (optional, press Enter for 'Mr.'): ");
    String? title = stdin.readLineSync();

    print("Formatted name: $title $firstName $lastName ");
  }
}
