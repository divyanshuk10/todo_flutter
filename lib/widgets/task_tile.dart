import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final void Function(bool? value) onChanged;
  final void Function() onLongPressed;

  TaskTile(this.title, this.isCompleted, this.onChanged, this.onLongPressed);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onLongPress: onLongPressed,
        child: const Icon(
          Icons.delete_forever,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            decoration:
                isCompleted ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.orange,
        value: isCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
