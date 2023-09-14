import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String text;
  const TaskCard({
    required this.text,
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
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
