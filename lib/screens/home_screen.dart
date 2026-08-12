import 'package:flutter/material.dart';
import 'package:to_do/models/tasks.dart';
import 'package:to_do/screens/add_task_screen.dart';
import 'package:to_do/widgets/task_tile.dart';
import '../constants/helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = dummyTasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddTaskScreen(
              onAddTask: (newTaskTitle) {
                setState(() {
                  tasks.add(
                    Task(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: newTaskTitle,
                    ),
                  );
                });
              },
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 20, bottom: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.amber),
                ),
                SizedBox(height: 10),
                Text("My Tasks", style: mainTextStyle),
                SizedBox(height: 10),
                Text("Stay organised, Stay productive", style: subTextStyle),
                SizedBox(height: 40)
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks left",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TaskTile(
                            key: ValueKey(task.id),
                            taskTitle: task.name,
                            isDone: task.isDone,
                            onCheckboxToggle: (newValue) {
                              setState(() {
                                task.toggleDone();
                              });
                            },
                            onDeleteTap: () {
                              setState(() {
                                tasks.removeWhere((t) => t.id == task.id);
                              });
                            },
                          ),
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
