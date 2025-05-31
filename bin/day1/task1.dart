import 'dart:io';

// ------------------------ factorial ---------------

void main(List<String> arguments) {
  int calcFactorial(int n) {
    if (n == 1) {
      return 1;
    }
    return n * calcFactorial(n - 1);
  }

  bool cond = true;
  while (cond) {
    stdout.writeln("Please Enter Positive number or press 0 to exit");
    String? value = stdin.readLineSync();
    if (value == "0") {
      break;
    }
    if (value != null) {
      int? number = int.tryParse(value);
      if (number != null && number > 0) {
        int result = number;
        for (var i = number - 1; i > 0; i++) {
          result *= i;
        }
        print("factorial of $number is $result");
      }
    }
  }

  // print('Hello world: ${tasks.calculate()}!');
}
