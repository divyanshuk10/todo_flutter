import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/task_cubit.dart';
import 'package:todo_flutter/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>(
      create: (BuildContext context) => TaskCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'To-Do',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const TaskScreen()),
    );
  }
}
