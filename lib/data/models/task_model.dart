import 'dart:convert';

import '../../domain/entities/task_entity.dart';

class TaskModel extends Task {
  TaskModel({
    String? taskId,
    String? title,
    String? description,
    bool? completed,
  }) : super(
          taskId: taskId,
          title: title,
          description: description,
          completed: completed,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['taskId'],
      title: json['title'],
      description: json['description'],
      completed: json['completed'],
    );
  }

  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'title': title,
      'description': description,
      'completed': isCompleted,
    };
  }

  Task toEntity() {
    return Task(
      taskId: taskId,
      title: title,
      description: description,
      completed: isCompleted,
    );
  }

  static TaskModel fromEntity(Task entity) {
    return TaskModel(
      taskId: entity.taskId,
      title: entity.title,
      description: entity.description,
      completed: entity.isCompleted,
    );
  }
}
