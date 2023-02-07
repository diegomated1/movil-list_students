library student_api;

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:list_students/student.model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserApi {
  String url = '${dotenv.get("API_HOST", fallback: "")}/estudiantes';

  Future<Students> get() async {
    var headers = {"Content-type": "application/json"};
    var response = await http.get(Uri.parse(url), headers: headers);
    if(response.statusCode == 200){
      return Students.fromJson(json.decode(response.body));
    } else {
      final String response = await rootBundle.loadString('assets/students.json');
      return Students.fromJson(json.decode(response));
    }
  }

}