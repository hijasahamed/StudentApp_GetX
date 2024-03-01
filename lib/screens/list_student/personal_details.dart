import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_app_getx/db/model/model.dart';

class Details extends StatelessWidget {
  const Details({super.key,required this.student});

  final Studentmodel student;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(student.name,style: const TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.deepPurpleAccent,        
      ),
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(8.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child:  Column(
              children: [
                 Card(
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
                                                              
                                  }, icon: const Icon(Icons.edit,color: Colors.green,)
                                )
                             ],
                           ),
                         ),
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('NAME:${student.name}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('AGE:${student.age}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('ADDRESS:${student.address}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                              Text('MOBILE:${student.mobile}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
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