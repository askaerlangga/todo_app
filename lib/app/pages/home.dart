import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Modal Bottom Sheet
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: 200,
                  padding: const EdgeInsets.all(15),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      // New Task Textfield
                      const TextField(
                        decoration: InputDecoration(
                          label: Text(
                            'New Task',
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Calendar Button
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.calendar_month)),

                          // Save Button
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Save'))
                        ],
                      )
                    ],
                  ),
                );
              });
        },
      ),
      appBar: AppBar(title: const Text('ToDo App')),
      body: ListView(
        children: const [],
      ),
    );
  }
}
