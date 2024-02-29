
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/db/functions/image_picker.dart';
import 'package:student_app_getx/screens/add_student/textform_fileds.dart';

class AddStudent extends StatelessWidget {
   AddStudent({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final Imagecontroller imagecontroller = Get.put(Imagecontroller());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Student Details',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green.shade900,
      ),
      body: TextFormFieldWidget(
        formkey: formkey, 
        namecontroller: namecontroller, 
        agecontroller: agecontroller, 
        addresscontroller: addresscontroller, 
        mobilecontroller: mobilecontroller, 
        size: size, 
        imagecontroller: imagecontroller, 
      ),
    );
  }
}
