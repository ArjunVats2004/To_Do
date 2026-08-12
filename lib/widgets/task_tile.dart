import 'package:flutter/material.dart';
import '../constants/helper.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isDone;
  final ValueChanged<bool?>? onCheckboxToggle;
  final VoidCallback? onDeleteTap;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.isDone,
    this.onCheckboxToggle,
    this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          if (onCheckboxToggle != null) {
            onCheckboxToggle!(!isDone);
          }
        },
        child: Icon(
          isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.amber,
        ),
      ),
      title: Text(
        taskTitle,
        style: taskTextStyle.copyWith(
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.red.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: onDeleteTap,
          icon: const Icon(Icons.delete_outline_outlined, size: 20),
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.grey.shade100,
    );
  }
}
