import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/home.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Scaffold(
        body: Home()
      ),
    );
  }
}
