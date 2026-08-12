import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String newTaskTitle) onAddTask;

  const AddTaskScreen({super.key, required this.onAddTask});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  void _submitTask() {
    final newTitle = _taskController.text.trim();
    if (newTitle.isNotEmpty) {
      widget.onAddTask(newTitle);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 30,
        right: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _taskController,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Add a new task',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 2),
              ),
            ),
            onSubmitted: (_) => _submitTask(),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: _submitTask,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Add',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
