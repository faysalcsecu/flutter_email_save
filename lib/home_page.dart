import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Login",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orangeAccent,
      ),

      // body: ,
    );
  }
}
