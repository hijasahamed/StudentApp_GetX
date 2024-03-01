import 'package:flutter/material.dart';
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
  }

  Future<void> addStudentToDb(Studentmodel value) async {
    final studentDB = await Hive.openBox<Studentmodel>('student_db');
    await studentDB.add(value);
    Get.snackbar('Success', 'Student detials saved Successfully',
        backgroundColor: Colors.green,
        overlayBlur: 1,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal);
  }

  void getStudents() {
    students.assignAll(studentBox.values.toList());
    studentBox.watch().listen((event) {
      students.assignAll(studentBox.values.toList());
    });
  }

  // void deleteStudent(Studentmodel value){
  //   studentBox.delete(value.key);
  //   students.remove(value);
  // }

}