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
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: Scaffold(
        backgroundColor: Colors.purple.shade50,
        floatingActionButton:
            Consumer<TaskProvider>(builder: (context, value, child) {
          return NewTaskButton(
            onPressed: () async {
              await _taskTable
                  .insert({'name': _taskController.text, 'is_done': 0});
              _taskController.clear();

              if (!context.mounted) return;
              Navigator.of(context).pop();
              setState(() {});
            },
            textController: _taskController,
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
                  return Center(
                    child: Icon(
                      Icons.check_circle,
                      size: 100,
                      color: Colors.purple.withOpacity(0.1),
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        text: snapshot.data![index].name ?? '',
                        deleteButtonOnPressed: () async {
                          await _taskTable.delete(snapshot.data![index].id!);
                          setState(() {});
                        },
                        isChecked:
                            (snapshot.data![index].isDone == 1) ? true : false,
                        onChanged: (value) async {
                          await _taskTable.update(
                              'is_done',
                              (value == true) ? 1 : 0,
                              snapshot.data![index].id!);
                          setState(() {});
                        },
                      );
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
