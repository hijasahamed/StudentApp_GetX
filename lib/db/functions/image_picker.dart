import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class Imagecontroller extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

}

pickimages(Imagecontroller imageController) async {
  Get.defaultDialog(
      title: 'Alert',
      titleStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
      backgroundColor: Colors.amber.shade500,
      content: const Text(
        'Photo options',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {
              final pickedimage=await ImagePicker().pickImage(source: ImageSource.camera);
              if(pickedimage != null){
                imageController.selectedImage.value= File(pickedimage.path);
              }
            },
            child: const Text(
              'Camera',
              style: TextStyle(color: Colors.black),
            )),
        ElevatedButton(
          onPressed: () async {
            final pickedimage=await ImagePicker().pickImage(source: ImageSource.gallery);
              if(pickedimage != null){
                imageController.selectedImage.value= File(pickedimage.path);
              }
          },
          child: const Text(
            'Gallery',
            style: TextStyle(color: Colors.black),
          ),
        )
      ]);
}