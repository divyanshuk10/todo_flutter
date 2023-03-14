import 'package:todo_flutter/models/task.dart';

class TaskModel {
  final List<Task> taskList;

  TaskModel({required this.taskList});

  Task getTask(int index) => taskList[index];

  List<Task> getTaskList() => taskList;

  void addTask(Task task) {
    taskList.add(task);
  }

  void setTaskList(List<Task> taskList) {
    taskList = taskList;
  }

  void removeTask(int index) {
    taskList.remove(taskList[index]);
  }

  void toggleTaskStatus(int index) {
    taskList[index].toggleTask();
  }

  int taskCount() => taskList.length;
}
