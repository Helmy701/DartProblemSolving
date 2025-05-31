import 'dart:io';

void main() {
  BankAccount bankAccount = BankAccount();

  stdout.writeln("Enter deposit amount: ");
  String? input = stdin.readLineSync();
  if (input != null) {
    bankAccount.deposit(int.tryParse(input));
    print("Balance: ${bankAccount.balance}");
  }

  stdout.writeln("Enter withdraw amount: ");
  String? inputwith = stdin.readLineSync();
  if (inputwith != null) {
    try {
      bankAccount.withdraw(int.tryParse(inputwith));
    } on InsufficientFundsError catch (e) {
      print(e.message());
    }
    print("Balance: ${bankAccount.balance}");
  }
}

class BankAccount {
  int _balance = 0;

  int get balance => _balance;

  void deposit(int? num) {
    if (num != null) _balance += num;
  }

  void withdraw(int? num) {
    if (num != null) {
      if (num > _balance) throw InsufficientFundsError();
      _balance -= num;
    }
  }
}

class InsufficientFundsError implements Exception {
  String message() => "Error: Insufficient funds";
}
