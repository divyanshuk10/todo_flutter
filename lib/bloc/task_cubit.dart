import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/models/task_model.dart';
import 'package:todo_flutter/bloc/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(taskModel: TaskModel(taskList: [])));

  Task getTask(int index) => state.taskModel.getTask(index);

  void addTask(Task task) => emit(TaskState(
      taskModel: TaskModel(taskList: [...state.taskModel.taskList, task])));

  /*final newState = state.copyWith(
        taskModel: state.taskModel
          ..setTaskList([...state.taskModel.getAllTasks(), task]));
    final newState = state.copyWith(taskModel: state.taskModel..addTask(task));*/

  void removeTask(int index) {
    var task = state.taskModel.taskList[index];
    var updatedList = [...state.taskModel.taskList];
    final newState =
        state.copyWith(taskModel: TaskModel(taskList: updatedList..remove(task)));
    emit(newState);
  }

  void toggleTaskStatus(int index) {
    final newState =
        state.copyWith(taskModel: state.taskModel..getTask(index).toggleTask());
    emit(newState);
  }

  int taskCount() => state.taskModel.taskCount();
}
