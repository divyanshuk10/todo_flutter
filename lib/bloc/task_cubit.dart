import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/task_state.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/models/task_model.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(taskModel: TaskModel(taskList: [])));

  void addTask(Task task) => emit(TaskState(
      taskModel: TaskModel(taskList: [...state.taskModel.taskList, task])));

  void removeTask(int index) {
    var task = state.taskModel.taskList[index];
    var updatedList = [...state.taskModel.taskList];
    final newState = state.copyWith(
        taskModel: TaskModel(taskList: updatedList..remove(task)));
    emit(newState);
  }

  void toggleTaskStatus(int index) {
    var updatedList = state.taskModel.taskList;
    updatedList[index].toggleTask();
    final newState =
        state.copyWith(taskModel: TaskModel(taskList: updatedList));
    emit(newState);
  }
}
