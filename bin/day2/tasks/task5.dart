// class Person {
//   String? _name;
//   int? _age;
// }

// class Student extends Person {
//   String? major;
// }

import 'dart:io';

void main() {
  Map<String, Student> students = {};

  while (true) {
    stdout.write("Enter student name (or 'done' to finish): ");
    String? name = stdin.readLineSync();
    if (name == null || name.toLowerCase() == 'done') break;

    stdout.write("Enter age: ");
    String? ageInput = stdin.readLineSync();
    int? age = int.tryParse(ageInput ?? '');
    if (age == null) {
      print("Invalid age. Try again.");
      continue;
    }

    stdout.write("Enter major: ");
    String? major = stdin.readLineSync();
    if (major == null || major.isEmpty) {
      print("Invalid major. Try again.");
      continue;
    }

    students[name] = Student(name, age, major);
    print("Student added.\n");
  }

  print("\nStudents aged 18 or older:");
  students.forEach((key, student) {
    if (student.age >= 18) {
      print(
        "Name: ${student.name}, Age: ${student.age}, Major: ${student.major}",
      );
    }
  });
}

class Person {
  final String _name;
  final int _age;

  Person(this._name, this._age);

  String get name => _name;
  int get age => _age;
}

class Student extends Person {
  String major;

  Student(super.name, super.age, this.major);
}
