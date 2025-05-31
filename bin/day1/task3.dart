import 'dart:io';

// ------------- calculator -----------------

int getNumber(String fs) {
  print("Enter $fs number:");
  String? input = stdin.readLineSync();
  if (input != null) {
    int? num = int.tryParse(input);
    if (num == null) {
      print("Error: it must be only numbers");
      return getNumber(fs);
    }
    return num;
  }
  print("Error: it shouldn't be null");
  return getNumber(fs);
}

void main() {
  while (true) {
    int x = getNumber("first");
    int y = getNumber("second");
    int result = 0;
    bool done = false;

    print("Enter operator (+, -, *, /, or 'q' to quit): ");
    String? input = stdin.readLineSync();

    if (input == "q") {
      break;
    } else if (input == "+") {
      result = x + y;
      done = true;
    } else if (input == "-") {
      result = x - y;
      done = true;
    } else if (input == "*") {
      result = x * y;
      done = true;
    } else if (input == "/") {
      if (y == 0) {
        print("You can't divide by 0");
      } else {
        result = (x / y).toInt();
        done = true;
      }
    } else {
      print("Invalid operator");
    }

    done
        ? print("Result: $x $input $y = $result")
        : print("Calculation failed.");
  }
}
