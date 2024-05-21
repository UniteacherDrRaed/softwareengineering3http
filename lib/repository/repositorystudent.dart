import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:untitled16/model/student.dart';

class RespositoryForStudents {
  Future<List<Student>> fetchDataOfStudent() async {
    final response = await http.get(
        Uri.parse("http://127.0.0.1:8000/appstudents/students/"));
    List<Student> students = [];
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      for (int i = 0; i < jsonResponse.length; i++) {
        Student student = Student(
            id: jsonResponse[i]['id'] as int,
            name: jsonResponse[i]['name'] as String,
            course: jsonResponse[i]['course'] as String
        );
        students.add(student);
      }
      return students;
    }
    else {
      throw Exception("Failed to fetch student data");
    }
  }


}

