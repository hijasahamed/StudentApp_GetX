import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/db/functions/home_controller.dart';
import 'package:student_app_getx/db/model/model.dart';
import 'package:student_app_getx/screens/edit_student/edit_student.dart';
import 'package:student_app_getx/screens/list_student/personal_details.dart';

final HomeController homeController = Get.put(HomeController()); 

class ListStudent extends StatelessWidget {
  const ListStudent({super.key,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 40, 39, 39)
        ),
        child: Obx(() {
          if(homeController.students.isEmpty){
            return const Center(
              child: Text('No Result',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            );
          }
          else{
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: homeController.students.length,
              itemBuilder: (context,index){
                final student = homeController.students[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(Details(student: student,),transition: Transition.zoom);
                  },
                  child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 59, 88, 61)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: FileImage(File(student.image)),
                                        ),
                                        IconButton(onPressed: (){
                                          Get.to( EditStudentScreen(student: student,));
                                        }, 
                                        icon: const Icon(Icons.edit,color: Colors.green,)
                                        ),
                                        IconButton(onPressed: (){
                                          onDelete(student,false);
                                        }, 
                                        icon: const Icon(Icons.delete,color: Colors.red,)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Name:${student.name.toUpperCase()}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                        Text('Age:${student.age}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                        Text('Address:${student.address.toUpperCase()}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                        Text('Mobile:+91 ${student.mobile}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),  
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                );
              }
            );
          }
        }),
      ),
    );
  }
}


  void onDelete(Studentmodel student, bool back){
    Get.defaultDialog(
      title: 'Confirm Deletion',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      middleText: 'Are you sure to delete this data',
      middleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      radius: 15,
      backgroundColor: Colors.red,
      onConfirm: () {
        homeController.delete(student);
        Get.back();
        if(back==true){
          Get.back();
        }
        Get.snackbar(
          'Deleted',
          'Student details removed',
          backgroundColor: Colors.red,
          overlayBlur: 1,
          duration: const Duration(seconds: 2)
        );
      },
      onCancel: () => Get.back(),
    );
  }