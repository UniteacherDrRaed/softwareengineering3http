import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled16/cubitpart/cubitforstudentapp.dart';
import 'package:untitled16/cubitpart/statesforstudentapp.dart';

import '../model/student.dart';

class MainPage extends StatelessWidget {
   MainPage({super.key});
bool inserteditem=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("الطلاب الغائبين"),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),

      body: BlocBuilder<CubitForStudentsApp, StatesForStudentApp>(
        builder: (context, state) {
          if (state is StateReadyForFetchingStudentData|| state is InitialStatesForStudentApp) {
            return LinearProgressIndicator();
          }
          if (state is StateFetchingStudentDataSuccessfully ) {
            List<Student> students = state.students;
            return ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Text("${students[index].id}"),
                      title: Text(students[index].name),
                      subtitle: Text(students[index].course),
                    ),
                  );
                });
          }
          if (state is StateFetchingStudentDataUnsuccessfully) {
            return Text(state.errorExp);
          }

          return const Text("Undefined State");
        },
      ),
    );
  }
}


/*
*    buildWhen: (previous, current){
          if (current !=null)
          {
            return current is StateFetchingStudentDataSuccessfully ||
              current is StateInsertingStudentSuccessfully;}
          return false;
        },*/