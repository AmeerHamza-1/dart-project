import 'dart:io';
import 'signupp.dart';

class Operations {
  List tasks = [];

  void addTask() {
    stdout.write("Enter a task: ");
    var task = stdin.readLineSync();
    if (task != null) {
      tasks.add(task);
      saveTasks();
      print("Task Added");
    } else {
      print("Task not added");
    }
  }

  void saveTasks() {
    var file = File("file.txt");
    file.writeAsStringSync(tasks.join("\n"));
  }

  void deleteTask() {
    stdout.write("Enter number of task to delete: ");
    var input = stdin.readLineSync();
    if (input != null) {
      var index = int.tryParse(input);
      if (index != null && index >= 0 && index < tasks.length) {
        tasks.removeAt(index-1);
        saveTasks();
        print("Task Deleted");
      } else if (index == String) {
        print("Invalid input. Please enter a number.");
      } else {
        print("Invalid index");
      }
    } else {
      print("Invalid input");
    }
  }

  void viewTasks() {
    if (tasks.length != 0) {
      print("Tasks:");
      for (var i = 0; i < tasks.length; i++) {
        print("${i + 1}. ${tasks[i]}");
      }
    } else {
      print("No tasks Availible");
    }
  }

  void exit() {
    print("Goodbye");
  }
}

void main() {
  var operations = Operations();
  var file = File("file.txt");
  if (file.existsSync()) {
    operations.tasks = file.readAsLinesSync();
  }

  while (true) {
    stdout.write("Do you Want to 1)Signup or 2)Login: ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write("Enter Userame: ");
      String? username = stdin.readLineSync();
      stdout.write("Enter Password: ");
      String? Password = stdin.readLineSync();
      if (username != null && Password != null) {
        signup(username, Password);
      } else {
        print("Invalid Input");
      }
    } else if (choice == '2') {
      stdout.write("Enter Username: ");
      String? username = stdin.readLineSync();
      stdout.write("Enter Password: ");
      String? Password = stdin.readLineSync();
      if (username != null && Password != null) {
        if (Login(username, Password)) {
          break;
        }
      } else {
        print("Invalid Input");
      }
    } else {
      print("Invalid Choice");
      return;
    }
  }

  // login();

  while (true) {
    stdout.write("Enter a command (1.add  2.delete  3.view  4.exit):");
    var command = stdin.readLineSync();
    switch (command) {
      case "1":
        operations.addTask();
        break;
      case "2":
        operations.deleteTask();
        break;
      case "3":
        operations.viewTasks();
        break;
      case "4":
        operations.exit();
        return;
      default:
        print("Invalid command");
        break;
    }
  }
}
