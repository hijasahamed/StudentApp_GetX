import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_app_getx/db/model/model.dart';
import 'package:student_app_getx/screens/add_student/add_student.dart';
import 'package:student_app_getx/screens/home_screen/home_screen.dart';
import 'package:student_app_getx/screens/list_student/list_student.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentmodelAdapter().typeId)){
    Hive.registerAdapter(StudentmodelAdapter());
  }
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/homescreen', page: () => const HomeScreen(),),
        GetPage(name: '/addstudent', page: () => const AddStudent(),),
        GetPage(name: '/studentlist', page: () => const ListStudent(),),
      ],
      initialRoute: '/homescreen',
      defaultTransition: Transition.leftToRightWithFade,
    );
  }
}

