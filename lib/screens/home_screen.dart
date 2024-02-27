import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text('Student Register'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon:const Icon(Icons.search)
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height*.77,
            width: size.width,            
          ),
          Flexible(
            child: SizedBox(
              child: Center(
                child: ElevatedButton(
                  style: const ButtonStyle(                    
                    backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)
                  ),
                  onPressed: (){
                
                  }, 
                  child:const Text('Add Student',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}