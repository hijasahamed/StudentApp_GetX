import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_app_getx/db/model/model.dart';
import 'package:student_app_getx/screens/add_student.dart';
import 'package:student_app_getx/screens/personal_details.dart';
import 'package:student_app_getx/screens/students_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        leading:  const Icon(Icons.menu,size: 33,),
        centerTitle: true,
        title: const Text('Student Register',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(context: context, delegate: Search()); 
            }, 
            icon:const Icon(Icons.search,size: 33)
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height*.77,
            width: size.width,
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: ListStudent(),
            ),
          ),
          Flexible(
            child: SizedBox(
              child: Center(
                child: ElevatedButton(
                  style:  ButtonStyle(                    
                    backgroundColor: MaterialStatePropertyAll(Colors.green.shade900,)
                  ),
                  onPressed: (){
                    Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return const AddStudent();
                        }));
                  }, 
                  child:const Text('Add Student',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class Search extends SearchDelegate {
  List data = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<Box<Studentmodel>>(
        future: Hive.openBox<Studentmodel>('student_db'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final stdbox = snapshot.data!.values.toList();
            final filteredData =stdbox
                .where((data) =>
                    data.name.toLowerCase().contains(query.toLowerCase()))
                .toList();
            if (query.isEmpty) {
              return const SizedBox();
            }
            else if(filteredData.isEmpty){
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('No Result',style: TextStyle(fontWeight: FontWeight.w500),)),
              ],
              );  
            }
            return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = filteredData[index];
                String namevalue = data.name;
                if (namevalue.toLowerCase().contains(query.toLowerCase())) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {                       
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => Details(details: data) 
                          ));
                        },
                        leading: CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(File(data.image)),
                        ),
                        title: Text(
                          data.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                      ),
                      const SizedBox(height: 12,),
                    ],
                  );
                } 
                else {
                  return const SizedBox();
                }
              },
              itemCount: filteredData.length,
            );
          } 
          else {
            return const SizedBox();
          }
        });
  }

  @override
  Widget buildResults(BuildContext context) {
     return FutureBuilder<Box<Studentmodel>>(
        future: Hive.openBox<Studentmodel>('student_db'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final stdbox = snapshot.data!.values.toList();
            final filteredData =stdbox
                .where((data) =>
                    data.name.toLowerCase().contains(query.toLowerCase()))
                .toList();
            if (query.isEmpty) {
              return const SizedBox();
            }
            else if(filteredData.isEmpty){
              return const  Column(
                mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Center(child: Text('Sorry Searched Result Not Found',style: TextStyle(fontWeight: FontWeight.w500),)),
              ],
              );  
            }
            return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = filteredData[index];
                String namevalue = data.name;
                if (namevalue.toLowerCase().contains(query.toLowerCase())) {
                  return Column(
                    children: [                      
                      ListTile(
                        onTap: () {                       
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => Details(details: data) 
                          ));
                        },
                        leading: CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(File(data.image)),
                        ),
                        title: Text(
                          data.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                      ),
                      const SizedBox(height: 12,),
                    ],
                  );
                } 
                else {
                  return const SizedBox();
                }
              },
              itemCount: filteredData.length,
            );
          } 
          else {
            return const SizedBox();
          }
        });
  }
}
