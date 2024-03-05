import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/db/model/model.dart';
import 'package:student_app_getx/screens/edit_student/edit_student.dart';
import 'package:student_app_getx/screens/list_student/list_student.dart';

class Details extends StatelessWidget {
  const Details({super.key,required this.student});

  final Studentmodel student;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('STUDENT  INFORMATION',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
        backgroundColor: Colors.green.shade900,      
      ),
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(8.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child:  Column(
              children: [
                Text(student.name.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
                 Card(
                  color: const Color.fromARGB(255, 59, 88, 61),
                  elevation: 10,              
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                        SizedBox(
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                                CircleAvatar(
                                  radius: 80,
                                  backgroundImage: FileImage(File(student.image)), 
                                ),
                                IconButton(onPressed: (){
                                    Get.to(EditStudentScreen(student: student));                         
                                  }, icon: const Icon(Icons.edit,color: Colors.green,)
                                ),
                                IconButton(onPressed: (){
                                    onDelete(student,true);                         
                                  }, icon: const Icon(Icons.delete,color: Colors.red,)
                                ),
                             ],
                           ),
                        ),
                        const SizedBox(height: 20,),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('NAME: ${student.name.toUpperCase()}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('AGE: ${student.age}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('ADDRESS: ${student.address.toUpperCase()}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('MOBILE: ${student.mobile}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}