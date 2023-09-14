import 'package:flutter/material.dart';
import 'package:todo_app/app/widgets/new_task_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> task = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      floatingActionButton: NewTaskButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Text('ToDo'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: task,
      ),
    );
  }
}
