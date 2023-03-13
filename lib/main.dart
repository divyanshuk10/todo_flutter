import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/task_model.dart';
import 'package:todo_flutter/task_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => TaskModel(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TaskScreen(),
    );
  }
}
