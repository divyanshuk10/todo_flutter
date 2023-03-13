import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/add_task_screen.dart';
import 'package:todo_flutter/task_model.dart';
import 'package:todo_flutter/task_tile.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (ctx, taskModel, child) {
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
                      const Text('To-Do via Provider',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Text('${taskModel.taskCount()} Tasks',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300))
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
                      child: ListView.builder(
                        itemCount: taskModel.taskCount(),
                        itemBuilder: (context, index) {
                          return TaskTile(
                            taskModel.getTask(index).title,
                            taskModel.getTask(index).isCompleted,
                            (value) {
                              taskModel.getTask(index).toggleTask();
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
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
