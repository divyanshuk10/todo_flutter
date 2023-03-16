import 'package:todo_flutter/models/task.dart';

class TaskModel {
  final List<Task> taskList;

  TaskModel({required this.taskList});

  int taskCount() => taskList.length;
}
