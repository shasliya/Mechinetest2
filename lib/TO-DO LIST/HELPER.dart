class Task {
  String title;
  String description;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map1) {
    return Task(
      title: map1['title'],
      description: map1['description'],
      isCompleted: map1['isCompleted'],
    );
  }
}