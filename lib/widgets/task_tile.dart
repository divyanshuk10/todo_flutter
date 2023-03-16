import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/task_cubit.dart';

class TaskTile extends StatelessWidget {
  final int index;
  final ValueChanged<bool?> onCheckChangedCallbackListener;
  final VoidCallback onDeleteCallbackListener;

  const TaskTile(this.onCheckChangedCallbackListener, this.onDeleteCallbackListener,
      this.index,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final taskModel = context.read<TaskCubit>().state.taskModel;

    return ListTile(
      onLongPress: onDeleteCallbackListener,
      title: Text(
        taskModel.taskList[index].title,
        style: TextStyle(
            decoration: taskModel.taskList[index].isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.orange,
        value: taskModel.taskList[index].isCompleted,
        onChanged: onCheckChangedCallbackListener,
      ),
    );
  }
}
