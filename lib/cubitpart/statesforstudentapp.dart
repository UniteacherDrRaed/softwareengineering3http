import '../model/student.dart';

abstract class StatesForStudentApp{}

class InitialStatesForStudentApp extends StatesForStudentApp{}
class StateReadyForFetchingStudentData extends StatesForStudentApp{}

class StateFetchingStudentDataSuccessfully extends StatesForStudentApp{

  final List<Student> students;
  StateFetchingStudentDataSuccessfully({required this.students});
}

class StateFetchingStudentDataUnsuccessfully extends StatesForStudentApp{

  final String errorExp;
  StateFetchingStudentDataUnsuccessfully({required this.errorExp});
}






