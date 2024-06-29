class Task {
  final String? taskId;
  final String? title;
  final String? description;
  final bool isCompleted;

  Task({this.taskId, this.title, this.description, bool? completed})
      : isCompleted = completed ?? false;

  Task copyWith(
      {int? id,
      String? title,
      String? description,
      bool? completed,
      String? taskId}) {
    return Task(
      taskId: taskId ?? this.taskId,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'Task{title: $title, description: $description, completed: $isCompleted, taskId: $taskId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Task &&
          runtimeType == other.runtimeType &&
          taskId == other.taskId &&
          title == other.title &&
          description == other.description &&
          isCompleted == other.isCompleted;

  @override
  int get hashCode =>
      taskId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode;
}
