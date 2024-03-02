
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app_getx/db/model/model.dart';

class HomeController extends GetxController {
  
  late final Box<Studentmodel> studentBox;

  final RxList<Studentmodel> students = <Studentmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    studentBox = Hive.box<Studentmodel>('student_db');
    getStudents();
  }
  
  void getStudents() {
    students.assignAll(studentBox.values.toList());
    studentBox.watch().listen((event) {
      students.assignAll(studentBox.values.toList());
    });
  }

  void delete(Studentmodel student){
    studentBox.delete(student.key);
    students.remove(student);
  }

}