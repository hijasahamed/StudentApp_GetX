import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/db/functions/image_picker.dart';

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
  });

  GlobalKey formkey;
  TextEditingController namecontroller;
  TextEditingController agecontroller;
  TextEditingController addresscontroller;
  TextEditingController mobilecontroller;
  Size size;
  Imagecontroller imagecontroller;

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
                            Obx((){
                              return Container(
                                height: 120,
                                width: 120,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black
                                ),
                                child: imagecontroller.selectedImage.value != null
                                ? ClipOval(
                                  child: Image.file(imagecontroller.selectedImage.value!,fit: BoxFit.cover,),
                                )
                                : const CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('images/circle avatar.png') as ImageProvider,
                                )
                              );
                            }),
                            Positioned(
                              bottom: -10,
                              right: -12,
                              child: IconButton(
                                onPressed: (){
                                  pickimages(imagecontroller);
                                }, 
                                icon: const Icon(Icons.add_a_photo_outlined)
                              ),
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
                          },
                          controller: agecontroller,
                          keyboardType: TextInputType.number,
                          inputFormatters: [LengthLimitingTextInputFormatter(2)],
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
                          },
                          controller: mobilecontroller,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '+91 ',
                            prefixStyle:
                                TextStyle(color: Colors.black, fontSize: 16),
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
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

