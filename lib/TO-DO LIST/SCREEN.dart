import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'HELPER.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late Box taskBox;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box('tasks');
  }

  void addTask() {
    if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
      final newTask = Task(
        title: titleController.text,
        description: descriptionController.text,
      );
      taskBox.add(newTask.toMap());
      titleController.clear();
      descriptionController.clear();
      setState(() {});
    }
  }

  void taskstatus(int index, Task task) {
    task.isCompleted = !task.isCompleted;
    taskBox.putAt(index, task.toMap());
    setState(() {});
  }

  void deleteTask(int index) {
    taskBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  labelText: 'Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(30)),labelText: 'Description'),
            ),
          ),
          ElevatedButton(
            onPressed: addTask,
            child: Text('Add Task'),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: taskBox.listenable(),
              builder: (context, Box box, _) {
                final tasks = box.values.map((e) => Task.fromMap(e)).toList();
                final pendingTasks = tasks.where((task) => !task.isCompleted).toList();
                final completedTasks = tasks.where((task) => task.isCompleted).toList();

                return ListView(
                  children: [
                    Text('Pending Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue)),
                    ...pendingTasks.map((task) {
                      int index = tasks.indexOf(task);
                      return ListTile(
                        title: Text(task.title),
                        subtitle: Text(task.description),
                        trailing: IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () => taskstatus(index, task),
                        ),
                        onLongPress: () => deleteTask(index),
                      );
                    }).toList(),
                    Divider(),
                    Text('Completed Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ...completedTasks.map((task) {
                      int index = tasks.indexOf(task);
                      return ListTile(
                        title: Text(task.title,),
                        subtitle: Text(task.description),
                        trailing: IconButton(
                          icon: Icon(Icons.undo),
                          onPressed: () => taskstatus(index, task),
                        ),
                        onLongPress: () => deleteTask(index),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}