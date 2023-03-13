import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/task.dart';
import 'package:todo_flutter/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState(taskList: []));

  Task getTask(int index) => state.taskList[index];

  void addTask(Task task) {
    final newState = state.copyWith(taskList: state.taskList..add(task));
    emit(newState);
  }

  void removeTask(Task task) {
    final newState = state.copyWith(taskList: state.taskList..remove(task));
    emit(newState);
  }

  void toggleTaskStatus(int index) {
    final newState =
        state.copyWith(taskList: state.taskList..[index].toggleTask());
    emit(newState);
  }

  int taskCount() => state.taskList.length;
}
