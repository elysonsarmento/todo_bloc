import 'package:todo/domain/entities/task_entity.dart';

abstract class ITaskRepository {
  Future<void> addTask(Task task);

  Future<void> removeTask(String id);

  Future<void> updateTask(Task task);

  Future<List<Task>> getTasks();

  Future<Task?> getTask(int id);

  Future<List<Task>> queryTask(String query);
}
