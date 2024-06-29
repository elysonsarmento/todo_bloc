import '../models/task_model.dart';
import '../source/local/task_local.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repositorie.dart';
import 'package:uuid/uuid.dart';

class TaskRepository implements ITaskRepository {
  final TaskLocalImpl _taskLocalDataSource;

  TaskRepository(this._taskLocalDataSource);

  @override
  Future<Task?> getTask(int id) async {
    return await _taskLocalDataSource.getTask(id);
  }

  @override
  Future<List<Task>> getTasks() async {
    final task = await _taskLocalDataSource.getTasks();
    return task;
  }

  @override
  Future<void> updateTask(Task task) async {
    return await _taskLocalDataSource.updateTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> addTask(Task task) async {
    if (task.taskId == null) {
      task = task.copyWith(taskId: Uuid().v4());
    }
    return await _taskLocalDataSource.insertTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> removeTask(String id) {
    return _taskLocalDataSource.deleteTask(id);
  }

  @override
  Future<List<Task>> queryTask(String query) async {
    return await _taskLocalDataSource.queryTask(query);
  }
}
