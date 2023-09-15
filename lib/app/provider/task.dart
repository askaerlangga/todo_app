import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  final List<Widget> _task = [];
  List<Widget> get task => _task;

  void addTask(Widget widget) {
    _task.add(widget);
    notifyListeners();
  }
}
