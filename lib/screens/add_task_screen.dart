import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/task_cubit.dart';
import 'package:todo_flutter/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  var _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Add Task'),
            TextField(
              controller: _controller,
              onChanged: (value) {
                _title = value;
              },
              decoration: const InputDecoration(
                  hintText: 'Enter a new task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
            TextButton(
                onPressed: () {
                  context.read<TaskCubit>().addTask(Task(title: _title));
                  Navigator.pop(context);
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
