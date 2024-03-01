import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/db/functions/functions.dart';

class ListStudent extends StatelessWidget {
  ListStudent({super.key});

  final HomeController homeController = Get.put(HomeController()); 

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(homeController.students.isEmpty){
        return const Center(
          child: Text('No Result'),
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
                
              },
              child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 31, 45, 32)),
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
                                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context){return EditStudent(student: data,);}));
                                    }, 
                                    icon: Icon(Icons.edit,color: Colors.green,)
                                    ),
                                    // IconButton(onPressed: (){deletebuttonclicked(data.id);}, icon: Icon(Icons.delete,color: Colors.red,)) 
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
                                    Text('Name:${student.name}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                    Text('Age:${student.age}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                    Text('Address:${student.address}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
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
    });
  }
}



/*
 GridView.builder( 
              itemCount: studentList.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                mainAxisExtent: 210,
                crossAxisSpacing:5
                ),
              itemBuilder: (ctx,index){
                final data=studentList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){ return Details(details: data,);}));
                  },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(255, 31, 45, 32)),
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
                                      backgroundImage: FileImage(File(data.image)),
                                    ),
                                    IconButton(onPressed: (){
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context){return EditStudent(student: data,);}));
                                    }, 
                                    icon: Icon(Icons.edit,color: Colors.green,)
                                    ),
                                    IconButton(onPressed: (){deletebuttonclicked(data.id);}, icon: Icon(Icons.delete,color: Colors.red,)) 
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
                                    Text('Name:${data.name}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                    Text('Age:${data.age}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                    Text('Address:${data.address}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),
                                    Text('Mobile:+91 ${data.mobile}',style:const TextStyle(fontWeight: FontWeight.w900,color: Colors.white),),  
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
            ); */