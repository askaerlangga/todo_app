import 'package:flutter/material.dart';

class NewTaskButton extends StatelessWidget {
  final void Function() onPressed;
  final void Function() onPressedDatePicker;
  final void Function() onPressedTimePicker;
  final TextEditingController textController;

  const NewTaskButton({
    required this.onPressed,
    required this.textController,
    super.key,
    required this.onPressedDatePicker,
    required this.onPressedTimePicker,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        // Modal Bottom Sheet
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    TextField(
                      controller: textController,
                      decoration: const InputDecoration(
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
                            onPressed: onPressedDatePicker,
                            icon: const Icon(Icons.calendar_month)),

                        // TimePicker Button
                        IconButton(
                          onPressed: onPressedTimePicker,
                          icon: const Icon(Icons.access_time),
                        ),
                        const Spacer(),

                        // Save Button
                        ElevatedButton(
                            onPressed: onPressed, child: const Text('Save'))
                      ],
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
