import 'package:equatable/equatable.dart';
import 'package:todo_flutter/task.dart';

class TaskState extends Equatable {
  final List<Task> taskList;

  const TaskState({required this.taskList});

  @override
  List<Object?> get props => [taskList];

  TaskState copyWith({
    required List<Task> taskList,
  }) {
    return TaskState(
      taskList: taskList,
    );
  }
}
