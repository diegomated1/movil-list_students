import 'package:flutter/material.dart';
import 'package:list_students/student.api.dart';
import 'package:list_students/student.model.dart';


class StudentsNotifier extends ChangeNotifier {
  late Future<Students> students;


  load(){
    students = UserApi().get();
    notifyListeners();
  }

  StudentsNotifier(){
    load();
  }
}