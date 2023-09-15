import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/provider/task.dart';
import 'package:todo_app/app/widgets/new_task_button.dart';
import 'package:todo_app/app/widgets/task_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: Scaffold(
        backgroundColor: Colors.purple.shade50,
        floatingActionButton:
            Consumer<TaskProvider>(builder: (context, value, child) {
          return NewTaskButton(
            onPressed: () {
              value.addTask(TaskCard(
                text: 'Test',
                deleteButtonOnPressed: () {},
              ));
            },
          );
        }),
        appBar: AppBar(
          title: const Text('ToDo'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: Consumer<TaskProvider>(builder: (context, value, child) {
          return ListView(
            children: value.task.toList(),
          );
        }),
      ),
    );
  }
}
