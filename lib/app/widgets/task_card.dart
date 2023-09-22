import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String text;
  final void Function()? deleteButtonOnPressed;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const TaskCard({
    required this.text,
    required this.isChecked,
    required this.onChanged,
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
                value: isChecked,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onChanged: onChanged),
            Expanded(
              child: Text(
                text,
                style: (isChecked == true)
                    ? const TextStyle(decoration: TextDecoration.lineThrough)
                    : null,
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
