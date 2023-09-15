import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String text;
  final void Function()? deleteButtonOnPressed;

  const TaskCard({
    required this.text,
    required this.deleteButtonOnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Checkbox(
                value: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onChanged: (value) {}),
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
                onPressed: deleteButtonOnPressed,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.purple,
                ))
          ],
        ),
      ),
    );
  }
}
