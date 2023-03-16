import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/task_cubit.dart';
import 'package:todo_flutter/bloc/task_state.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/widgets/task_tile.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 60.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CircleAvatar(
                        radius: 40.0,
                        child: Icon(
                          Icons.playlist_add_check_circle_outlined,
                          size: 50.0,
                        )),
                    const Text('To-Do via Bloc, Cubit',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold)),
                    Text(
                        '${context.watch<TaskCubit>().state.taskModel.taskCount()} Tasks',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: BlocBuilder<TaskCubit, TaskState>(
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount: context
                              .read<TaskCubit>()
                              .state
                              .taskModel
                              .taskCount(),
                          itemBuilder: (context, index) {
                            return TaskTile((value) {
                              context.read<TaskCubit>().toggleTaskStatus(index);
                            }, () {
                              context.read<TaskCubit>().removeTask(index);
                            }, index);
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskScreen();
              },
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
