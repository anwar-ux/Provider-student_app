import 'package:flutter/material.dart';
import 'package:student_app_provider/database/database.dart';
import 'package:student_app_provider/model/model.dart';

class HomePageProvider extends ChangeNotifier {
  late DatabaseHelper databaseHelper;
  List<Student> students = [];
  List<Student> filteredStudents = [];
  bool isSearching = false;

  HomePageProvider() {
    databaseHelper = DatabaseHelper();
  }

  Future<void> refreshStudentList() async {
    final studentlist = await databaseHelper.getStudents();
    students = studentlist;
    filteredStudents = studentlist;
    notifyListeners();
  }

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      filteredStudents = students;
    
    }
    notifyListeners();
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      filteredStudents = students;
    } else {
      filteredStudents = students
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
