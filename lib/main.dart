import 'package:flutter/material.dart';
import 'package:todo_app/app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
