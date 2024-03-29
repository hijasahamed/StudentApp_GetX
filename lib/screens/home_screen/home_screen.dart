import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/screens/add_student/add_student.dart';
import 'package:student_app_getx/screens/list_student/list_student.dart';
import 'package:student_app_getx/screens/search.dart/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.bottomSheet(
                  Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.wb_sunny_outlined),
                        title: const Text('Light Mode'),
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.nightlight_round_outlined),
                        title: const Text('Dark Mode'),
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                          Get.back();
                        },
                      ),
                    ],
                  ),
                  backgroundColor: Colors.black);
            },
            icon: const Icon(
              Icons.menu,
              size: 33,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          'STUDENT REGISTER',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(
                Icons.search,
                size: 33,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
           const Expanded(
            flex: 9, 
            child: Padding(
                padding: EdgeInsets.all(5), child: ListStudent()),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: SizedBox(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                      Colors.green.shade900,
                    )),
                    onPressed: () {
                      Get.to(
                        () => AddStudent(),
                        transition: Transition.cupertinoDialog,
                      );
                    },
                    child: const Text(
                      'Add Student',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
