import 'package:sqflite/sqflite.dart';

class TaskTable {
  final String tableName = 'task';
  final String id = 'id';
  final String name = 'name';

  // Create table
  Future create(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $name TEXT NULL)');
  }
}
