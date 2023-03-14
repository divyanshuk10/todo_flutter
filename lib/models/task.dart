class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  void toggleTask() {
    isCompleted = isCompleted == true ? false : true;
  }
}
