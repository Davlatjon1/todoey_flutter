import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'task_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: (){
              taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount);
      },
    );
  }
}