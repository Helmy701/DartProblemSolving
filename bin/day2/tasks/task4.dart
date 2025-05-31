import 'dart:io';

void main() {
  // Use int or double as needed
  GradeBook<num> gradeBook = GradeBook<num>();

  while (true) {
    stdout.write("Enter grades (\"done\" to finish): ");
    String? input = stdin.readLineSync();

    if (input != null) {
      if (input.toLowerCase() == "done") break;

      num? number = num.tryParse(input);
      if (number == null) {
        print("Error: Invalid grade format");
      } else {
        gradeBook.addGrade(number);
      }
    }
  }

  gradeBook.calcAverage();
}

class GradeBook<T extends num> {
  final List<T> grades = [];

  void addGrade(T grade) {
    grades.add(grade);
  }

  void calcAverage() {
    if (grades.isEmpty) {
      print("No grades entered.");
      return;
    }

    num sum = grades.fold(0, (prev, e) => prev + e);
    double avg = sum / grades.length;

    print("Grades: $grades (Avg: ${avg.toStringAsFixed(2)})");
  }
}
