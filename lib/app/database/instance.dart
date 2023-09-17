import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app/database/task_table.dart';

class DatabaseInstance {
  final String _databaseName = 'todo_app.db';
  final int _databaseVersion = 1;

  Future _initDatabase() async {
    // Penyimpanan database
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    TaskTable task = TaskTable();
    String path = join(documentDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: task.create);
  }

  // Inisialisasi database
  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
}
