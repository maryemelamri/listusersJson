import 'package:flutter/material.dart';
import 'package:listeusers/home.dart';

void main() {
  // Future<void> main() async {

  runApp(const MainApp());
  // }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jhhhhhhh',
      home: ListUserPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
