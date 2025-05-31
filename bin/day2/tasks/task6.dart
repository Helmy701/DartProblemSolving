import 'dart:io';

abstract class PaymentMethod {
  final double amount;

  PaymentMethod(this.amount);

  void processPayment();
}

// Credit Card Payment Implementation
class CreditCardPayment extends PaymentMethod {
  final String cardNumber;

  CreditCardPayment(double amount, this.cardNumber) : super(amount);

  @override
  void processPayment() {
    print(
      "Processing Credit Card payment of \$${amount.toStringAsFixed(2)} using card $cardNumber",
    );
  }
}

// PayPal Payment Implementation
class PayPalPayment extends PaymentMethod {
  final String email;

  PayPalPayment(double amount, this.email) : super(amount);

  @override
  void processPayment() {
    print(
      "Processing PayPal payment of \$${amount.toStringAsFixed(2)} using account $email",
    );
  }
}

class InvalidPaymentException implements Exception {
  final String message;
  InvalidPaymentException(this.message);
  @override
  String toString() => "Error: $message";
}

// Main CLI
void main() {
  try {
    stdout.write("Enter payment type (credit/paypal): ");
    String? type = stdin.readLineSync()?.trim().toLowerCase();

    stdout.write("Enter payment amount: ");
    String? amountInput = stdin.readLineSync();
    double? amount = double.tryParse(amountInput ?? '');

    if (amount == null || amount <= 0) {
      throw InvalidPaymentException("Amount must be a number greater than 0.");
    }

    PaymentMethod? payment;

    if (type == 'credit') {
      stdout.write("Enter card number: ");
      String? card = stdin.readLineSync();
      if (card == null || card.isEmpty) {
        throw InvalidPaymentException("Invalid card number.");
      }
      payment = CreditCardPayment(amount, card);
    } else if (type == 'paypal') {
      stdout.write("Enter PayPal email: ");
      String? email = stdin.readLineSync();
      if (email == null || !email.contains('@')) {
        throw InvalidPaymentException("Invalid email address.");
      }
      payment = PayPalPayment(amount, email);
    } else {
      throw InvalidPaymentException("Unsupported payment type.");
    }

    payment.processPayment();
  } catch (e) {
    print(e);
  }
}
