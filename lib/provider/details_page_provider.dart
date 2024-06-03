import 'package:flutter/material.dart';
import 'package:student_app_provider/database/database.dart';

class StudentDetailProvider extends ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper();

  Future<void> deleteStudent(int studentId) async {
    await db.deleteStudent(studentId);
  }
}
