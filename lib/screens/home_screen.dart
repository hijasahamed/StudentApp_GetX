import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqryheight=MediaQuery.of(context).size.height;
    final mediaqrywidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Register'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon:const Icon(Icons.search)
          )
        ],
      ),
      body: Container(),
    );
  }
}