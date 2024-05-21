import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled16/cubitpart/statesforstudentapp.dart';

import '../model/student.dart';
import '../repository/repositorystudent.dart';

class CubitForStudentsApp extends Cubit<StatesForStudentApp> {
  CubitForStudentsApp() : super(InitialStatesForStudentApp());

  Future<void> fetchingStudentData() async {
    RespositoryForStudents rep = RespositoryForStudents();
    try {
      emit(StateReadyForFetchingStudentData());
      List<Student> students = await rep.fetchDataOfStudent();
      emit(StateFetchingStudentDataSuccessfully(students: students));
    } catch (errorExp) {
      emit(StateFetchingStudentDataUnsuccessfully(
          errorExp: errorExp.toString()));
    }
  }

}
