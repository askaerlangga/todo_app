import 'package:flutter/material.dart';
import 'package:todo_app/app/widgets/new_task_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NewTaskButton(),
      appBar: AppBar(title: const Text('ToDo App')),
      body: ListView(
        children: const [],
      ),
    );
  }
}
