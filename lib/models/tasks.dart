class Task {
  final String id;
  final String name;
  bool isDone;

  Task({
    required this.id,
    required this.name,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}

List<Task> dummyTasks = [
  Task(id: '1', name: 'Buy groceries', isDone: false),
  Task(id: '2', name: 'Complete Flutter assignment', isDone: true),
  Task(id: '3', name: 'Call Mom', isDone: false),
  Task(id: '4', name: 'Read a chapter of a book', isDone: false),
  Task(id: '5', name: 'Workout for 30 mins', isDone: true),
];
