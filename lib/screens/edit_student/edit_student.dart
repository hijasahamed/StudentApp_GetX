import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app_getx/db/functions/functions.dart';
import 'package:student_app_getx/db/model/model.dart';
import 'package:student_app_getx/screens/add_student/add_student.dart';



// ignore: must_be_immutable
class EditStudent extends StatefulWidget {
   EditStudent({super.key, required this.student});

  Studentmodel student;
  
  @override
  State<EditStudent> createState() => EditStudentState();
}

class EditStudentState extends State<EditStudent> {

  final GlobalKey<FormState> _validation = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();

  @override
 void initState() {
  print('id=${widget.student.id}');
   _namecontroller.text = widget.student.name;
   _agecontroller.text = widget.student.age;
   _addresscontroller.text = widget.student.address;
   _mobilecontroller.text = widget.student.mobile;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Student Details',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor:Colors.green.shade900,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Form(
                  key: _validation,
                  child: Column(
                    children: [

                      Stack(
                        children: [
                          // CircleAvatar(
                          //   backgroundImage:image1 != null
                          //   ? FileImage(image1!)
                          //   : FileImage(File(widget.student.image)),
                          //   radius: 60,
                          // ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.lightGreen,
                              child: IconButton(
                                  onPressed: () {
                                    
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.black,
                                    size: 20,
                                  )),
                            ),
                          )
                        ],
                      ),


                      const SizedBox(height: 25),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter a value';
                          }
                        },
                        controller: _namecontroller,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(),
                            labelText: 'Name'),
                            textCapitalization: TextCapitalization.words,
                      ),


                      const SizedBox(height: 25),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter a value';
                          }
                        },
                        controller: _agecontroller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month),
                            border: OutlineInputBorder(),
                            labelText: 'Age'),
                      ),


                      const SizedBox(height: 25),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter a value';
                          }
                        },
                        controller: _addresscontroller,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.place),
                            border: OutlineInputBorder(),
                            labelText: 'Address'),
                            textCapitalization: TextCapitalization.words,
                      ),


                      const SizedBox(height: 25),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter a value';
                          }
                        },
                        controller: _mobilecontroller,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
                  )
                ),

              const SizedBox(height: 25),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(minimumSize: const Size(360, 45 ),backgroundColor: Colors.green.shade900,),
                  onPressed: () {
                    
                  },                 
                  icon: const Icon(Icons.check,color: Colors.white,),
                  label: const Text('Update',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)
              ),
            ],
          ),
        ),
      )),
    );
  }

  

  

}

