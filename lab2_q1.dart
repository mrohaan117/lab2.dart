import 'dart:io';

void main() {
  List<String> tasks = [];
  while (true) {
    print('1. Add a task');
    print('2. View tasks');
    print('3. Remove a task');
    print('4. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter the task: ');
        String? task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print('Task added.');
        } else {
          print('Task cannot be empty.');
        }
        break;
      case '2':
        if (tasks.isEmpty) {
          print('No tasks available.');
        } else {
          print('Tasks:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i]}');
          }
        }
        break;
      case '3':
        stdout.write('Enter the task index to remove: ');
        String? indexInput = stdin.readLineSync();
        if (indexInput != null && int.tryParse(indexInput) != null) {
          int index = int.parse(indexInput) - 1;
          if (index >= 0 && index < tasks.length) {
            tasks.removeAt(index);
            print('Task removed.');
          } else {
            print('Invalid index.');
          }
        } else {
          print('Please enter a valid number.');
        }
        break;
      case '4':
        print('Exiting...');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}
