import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/db/functions/home_controller.dart';
import 'package:student_app_getx/db/functions/image_picker.dart';
import 'package:student_app_getx/db/model/model.dart';
import 'package:student_app_getx/screens/home_screen/home_screen.dart';
import 'package:student_app_getx/screens/list_student/list_student.dart';

class EditStudentScreen extends StatelessWidget {
  EditStudentScreen({
    super.key,
    required this.student,
  });

  final Studentmodel student;
  final HomeController controller = Get.find<HomeController>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final Imagecontroller imagecontroller = Get.put(Imagecontroller());

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: student.name);
    TextEditingController ageController =
        TextEditingController(text: student.age);
    TextEditingController addressController =
        TextEditingController(text: student.address);
    TextEditingController mobileController =
        TextEditingController(text: student.mobile);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
        backgroundColor: Colors.green.shade900,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Obx(() {
                              return Container(
                                  height: 120,
                                  width: 120,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: imagecontroller.selectedImage.value !=
                                          null
                                      ? ClipOval(
                                          child: Image.file(
                                            imagecontroller
                                                .selectedImage.value!,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              FileImage(File(student.image)),
                                        ));
                            }),
                            Positioned(
                              bottom: -12,
                              right: -11,
                              child: IconButton(
                                  onPressed: () {
                                    pickimages(imagecontroller);
                                  },
                                  icon: Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.green.shade900,
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please eneter the name';
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.abc),
                              border: OutlineInputBorder(),
                              labelText: 'Name'),
                          textCapitalization: TextCapitalization.words,
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please eneter the age';
                            }
                            return null;
                          },
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.calendar_month),
                              border: OutlineInputBorder(),
                              labelText: 'Age'),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please eneter the Place';
                            }
                            return null;
                          },
                          controller: addressController,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.place),
                              border: OutlineInputBorder(),
                              labelText: 'Place'),
                          textCapitalization: TextCapitalization.words,
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty || value.length != 10) {
                              return 'Please eneter a valid phone number';
                            }
                            return null;
                          },
                          controller: mobileController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '+91 ',
                            prefixStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
                            suffixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            labelText: 'Mobile',
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 25),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(360, 45),
                      backgroundColor: Colors.green.shade900,
                    ),
                    onPressed: ()async {
                      await checkImage(imagecontroller,student);
                      homeController.updateStudent(
                          student,
                          nameController.text,
                          ageController.text,
                          addressController.text,
                          mobileController.text,
                          imagecontroller);
                      Get.offAll(const HomeScreen());    
                      Get.snackbar(
                          'Success', 'Student detials updated Successfully',
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                          dismissDirection: DismissDirection.horizontal);                      
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }

  checkImage(ic,std){
    ic.selectedImage.value ??= File(std.image);
  }
}
