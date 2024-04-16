import 'package:flutter/material.dart';

// void main() {
//   runApp(course());
// }

class Course {
  String code;
  String title;
  String description;

  Course({required this.code, required this.title, this.description = ""});
}
