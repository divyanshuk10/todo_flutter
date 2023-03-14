import 'package:equatable/equatable.dart';
import 'package:todo_flutter/models/task_model.dart';

class TaskState extends Equatable {
  final TaskModel taskModel;

  const TaskState({required this.taskModel});

  @override
  List<Object?> get props => [taskModel];

  TaskState copyWith({
    required TaskModel taskModel,
  }) {
    return TaskState(
      taskModel: taskModel,
    );
  }
}
