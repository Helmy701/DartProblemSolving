import 'dart:io';

void main() {
  String password = "1234";
  int balance = 1000;
  print("Welcome to the ATM.");
  stdout.write("Enter your PIN: ");
  String? inPass = stdin.readLineSync();
  if (inPass != password) {
    print("U Entered Wrong password");
  } else {
    while (true) {
      bool exit = false;
      print(
        "--- ATM Menu --- \n1. Check Balance \n2. Deposit \n3. Withdraw \n4. Exit",
      );
      String? choice = stdin.readLineSync();
      switch (choice) {
        case '4':
          exit = true;
          break;

        case '1':
          print(balance);
          break;

        case '2':
          while (true) {
            stdout.write("Enter the amount of Deposite: ");
            String? depositeString = stdin.readLineSync();

            if (depositeString != null) {
              int? deposite = int.tryParse(depositeString);
              if (deposite != null && deposite >= 0) {
                balance += deposite;
                break;
              } else {
                print("Please Enter Valid positive number or 0 to exit");
              }
            }
          }
        case '3':
          while (true) {
            stdout.write("Enter the amount of withdraw: ");
            String? withdrawString = stdin.readLineSync();

            if (withdrawString != null) {
              int? withdraw = int.tryParse(withdrawString);
              if (withdraw != null && withdraw > balance) {
                print("Error: u Don't have that balance in your account");
              }
              if (withdraw != null && withdraw >= 0 && withdraw <= balance) {
                balance -= withdraw;
                break;
              } else {
                print("Please Enter Valid positive number or 0 to exit");
              }
            }
          }
      }
      if (exit == true) break;
    }
  }
}
