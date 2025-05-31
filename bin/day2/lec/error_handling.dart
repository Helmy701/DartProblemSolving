void main() {
  try {
    setAge(-10);
  } on NegativeAgeError catch (e) {
    print(e);
  }
  print("contenue");
}

void setAge(int age) {
  if (age < 0) throw NegativeAgeError().message();
  print(age);
}

class NegativeAgeError implements Exception {
  String message() => "Age Shouldn't be Negative";
}
