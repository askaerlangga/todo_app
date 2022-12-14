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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: 150,
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
                        children: [
                          // DatePicker Button
                          IconButton(
                              onPressed: () async {
                                var selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime.now());
                                print(selectedDate);
                              },
                              icon: const Icon(Icons.calendar_month)),

                          // TimePicker Button
                          IconButton(
                            onPressed: () async {
                              var selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      const TimeOfDay(hour: 0, minute: 0));
                              print(selectedTime);
                            },
                            icon: const Icon(Icons.access_time),
                          ),
                          const Spacer(),

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
