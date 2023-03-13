import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/task.dart';

class TaskModel extends ChangeNotifier {
  List<Task> _taskList = [];


  Task getTask(int index) => _taskList[index];

  void addTask(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    _taskList.remove(index);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _taskList[index].toggleTask();
    notifyListeners();
  }

  int taskCount() => _taskList.length;
}
