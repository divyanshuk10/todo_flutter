import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final void Function(bool? value) onChanged;

  TaskTile(this.title, this.isCompleted, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
