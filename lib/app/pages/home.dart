import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/database/table/task_table.dart';
import 'package:todo_app/app/provider/task.dart';
import 'package:todo_app/app/widgets/new_task_button.dart';
import 'package:todo_app/app/widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskTable _taskTable = TaskTable();
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
              // value.addTask(TaskCard(
              //   text: 'Test',
              //   deleteButtonOnPressed: () {},
              // ));
            },
            textController: value.newTaskController,
          );
        }),
        appBar: AppBar(
          title: const Text('ToDo'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        body: FutureBuilder(
            future: _taskTable.selectAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Text('Tidak ada data');
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                          text: snapshot.data![index].name ?? '',
                          deleteButtonOnPressed: () {});
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
