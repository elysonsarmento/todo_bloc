import "package:hive/hive.dart";

import "../../models/task_model.dart";

class TaskLocalImpl {
  late Future<Box<String>> box;

  TaskLocalImpl() {
    box = openBox();
  }

  Future<Box<String>> openBox() async {
    return await Hive.openBox('taskbox');
  }

  Future<List<TaskModel>> getTasks() async {
    final box = await this.box;
    final tasks = box.values.map((e) => TaskModel.fromRawJson(e)).toList();
    return tasks;
  }

  Future<TaskModel?> getTask(int id) async {
    final box = await this.box;
    final task = box.get(id);
    if (task != null) {
      return TaskModel.fromRawJson(task);
    }
    return null;
  }

  Future<void> insertTask(TaskModel task) async {
    final box = await this.box;
    await box.put(task.taskId.toString(), task.toRawJson());
  }

  Future<void> updateTask(TaskModel task) async {
    final box = await this.box;
    await box.put(task.taskId.toString(), task.toRawJson());
  }

  Future<void> deleteTask(String id) async {
    final box = await this.box;

    box.delete(id);
  }

  Future<List<TaskModel>> queryTask(String query) async {
    final box = await this.box;
    try {
      final tasks = box.values
          .map((e) => TaskModel.fromRawJson(e))
          .where((element) =>
              element.description!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return tasks;
    } catch (e) {
      return [];
    }
  }
}
