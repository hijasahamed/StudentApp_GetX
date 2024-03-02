import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app_getx/db/functions/home_controller.dart';
import 'package:student_app_getx/db/functions/image_picker.dart';
import 'package:student_app_getx/db/model/model.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.formkey,
    required this.namecontroller,
    required this.agecontroller,
    required this.addresscontroller,
    required this.mobilecontroller,
    required this.size,
    required this.imagecontroller,
    required this.fromedit,
  });

  final GlobalKey formkey;
  final TextEditingController namecontroller;
  final TextEditingController agecontroller;
  final TextEditingController addresscontroller;
  final TextEditingController mobilecontroller;
  final Size size;
  final Imagecontroller imagecontroller;
  final bool fromedit;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                      : const CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                                  'images/circle avatar.png')
                                              as ImageProvider,
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
                          controller: namecontroller,
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
                          controller: agecontroller,
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
                          controller: addresscontroller,
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
                          controller: mobilecontroller,
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
                    onPressed: () {
                      onsubmit(namecontroller, agecontroller, addresscontroller,
                          mobilecontroller, imagecontroller, formkey);
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                 ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> onsubmit(namecontroller, agecontroller, addresscontroller,
      mobilecontroller, imagecontroller, formkey) async {
    if (formkey.currentState!.validate() &&
        imagecontroller.selectedImage.value == null) {
      Get.snackbar('Error', 'Please select a photo',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          overlayBlur: 1,
          duration: const Duration(seconds: 2),
          dismissDirection: DismissDirection.horizontal);
    } else if (formkey.currentState!.validate() &&
        imagecontroller.selectedImage.value != null) {
      Studentmodel value = Studentmodel()
        ..name = namecontroller.text.trim()
        ..age = agecontroller.text.trim()
        ..address = addresscontroller.text.trim()
        ..mobile = mobilecontroller.text.trim()
        ..image = imagecontroller.selectedImage.value!.path;
      addStudentToDb(value);
      Get.back();
    } else if (imagecontroller.selectedImage.value == null &&
        !formkey.currentState!.validate()) {
      Get.snackbar('error', 'Please complete the form before submission',
          backgroundColor: Colors.red,
          overlayBlur: 1,
          duration: const Duration(seconds: 2),
          dismissDirection: DismissDirection.horizontal);
    }
  }

  Future<void> addStudentToDb(Studentmodel value) async {
    final studentDB = Hive.box<Studentmodel>('student_db');
    await studentDB.add(value);
    Get.snackbar('Success', 'Student detials saved Successfully',
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal);
  }
}
