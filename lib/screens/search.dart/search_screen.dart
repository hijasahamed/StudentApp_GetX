import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/db/functions/home_controller.dart';
import 'package:student_app_getx/screens/list_student/personal_details.dart';

class Search extends SearchDelegate {
  List data = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          List filtered1 = controller.students;
          final filtered = filtered1
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()))
              .toList();         
          if (controller.students.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = filtered[index];
                String nameval = data.name;
                if ((nameval).contains(query)) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: () {
                              Get.to(Details(student: data));
                            },
                            title: Text(data.name),
                            leading: CircleAvatar(
                              backgroundImage: FileImage(File(data.image)),
                            ),
                            trailing: IconButton(
                              onPressed: (){
                          
                              }, 
                              icon: const Icon(Icons.more_vert)
                            )
                          ),
                        ),
                        const SizedBox(height: 8,),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: filtered.length,
            );
          } else {
            return const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          List filtered1 = controller.students;
          final filtered = filtered1
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
          if (query.isEmpty) {
            return const Center(
              child: Text('Please search for results',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            );
          } 
          else if (filtered.isEmpty) {
            return const Center(
              child: Text('No searched results',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            );
          }
          if (controller.students.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = filtered[index];
                String nameval = data.name;
                if ((nameval).contains((query.trim()))) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(Details(student: data));
                        },
                        title: Text(data.name),
                        leading: CircleAvatar(
                          backgroundImage: FileImage(File(data.image)),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                } else {}
                return null;
              },
              itemCount: filtered.length,
            );
          } else {
            return const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        });
  }
}
