class TaskModel {
  int? id;
  String? name;
  int? isDone;

  TaskModel({this.id, this.name, this.isDone});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'], name: json['name'], isDone: json['is_done']);
  }
}
