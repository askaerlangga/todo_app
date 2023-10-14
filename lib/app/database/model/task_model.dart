class TaskModel {
  int? id;
  String? name;
  int? isDone;
  String? date;
  String? time;

  TaskModel({this.id, this.name, this.isDone, this.date, this.time});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      name: json['name'],
      isDone: json['is_done'],
      date: json['date'],
      time: json['time'],
    );
  }
}
