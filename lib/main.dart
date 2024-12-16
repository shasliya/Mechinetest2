import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'TO-DO LIST/SCREEN.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('tasks'); // Open a box to store tasks
  runApp(Todolist());
}

class Todolist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      home: TodoPage(),
    );
  }
}