import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app/database/instance.dart';
import 'package:todo_app/app/database/model/task_model.dart';

class TaskTable {
  final DatabaseInstance _databaseInstance = DatabaseInstance();

  final String _tableName = 'task';
  final String _id = 'id';
  final String _name = 'name';
  final String _isDone = 'is_done';
  final String _date = 'date';
  final String _time = 'time';

  // Create table
  Future create(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_tableName ($_id INTEGER PRIMARY KEY, $_name TEXT NULL, $_isDone INTEGER NULL, $_date TEXT NULL, $_time TEXT NULL)');
  }

  Future<List<TaskModel>> selectAll() async {
    Database db = await _databaseInstance.database();
    final data = await db.query(_tableName);
    List<TaskModel> result = data.map((e) => TaskModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await _databaseInstance.database();
    final query = await db.insert(_tableName, row);
    return query;
  }

  Future<int> delete(int id) async {
    Database db = await _databaseInstance.database();
    return await db.delete(_tableName, where: '$_id = ?', whereArgs: [id]);
  }

  Future<int> update(String column, var value, int id) async {
    Database db = await _databaseInstance.database();
    return await db.rawUpdate(
        'UPDATE $_tableName SET $column = ? WHERE id = ?', [value, id]);
  }

  // void hapusDatabase() {
  //   _databaseInstance.hapusDatabase();
  // }
}
