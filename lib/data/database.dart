import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  // Reference
  List<List<dynamic>> toDoList = [];
  final _myBox = Hive.box('mybox');

  // Opens app for the first time
  void createInitialData() {
    toDoList = [];
    updateDataBase(); // Save initial data to the database
  }

  // Load data from db
  void loadData() {
    // Check if the data exists in the box
    if (_myBox.get("TODOLIST") != null) {
      toDoList = List<List<dynamic>>.from(_myBox.get("TODOLIST"));
    } else {
      createInitialData(); // Create initial data if not present
    }
  }

  // Update db (corrected method name)
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }

  // Add a new task
  void addTask(String task) {
    toDoList.add([task, false]);
    updateDataBase();
  }

  // Delete a task
  void deleteTask(int index) {
    toDoList.removeAt(index);
    updateDataBase();
  }

  // Toggle task completion
  void toggleTaskCompletion(int index) {
    toDoList[index][1] = !toDoList[index][1];
    updateDataBase();
  }
}
