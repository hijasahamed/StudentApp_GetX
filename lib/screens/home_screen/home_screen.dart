import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app_getx/screens/add_student/add_student.dart';
import 'package:student_app_getx/screens/list_student/list_student.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 33,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .77,
              width: size.width,
              child: const Padding(
                  padding: EdgeInsets.all(5), child: ListStudent()),
            ),
            Flexible(
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
            )
          ],
        ),
      ),
    );
  }
}
