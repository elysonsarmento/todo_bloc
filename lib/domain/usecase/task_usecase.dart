import '../entities/task_entity.dart';
import '../repositories/task_repositorie.dart';

class TaskUseCase {
  final ITaskRepository _taskRepository;

  TaskUseCase(this._taskRepository);

  Future<List<Task>> getTasks() async {
    return await _taskRepository.getTasks();
  }

  Future<Task?> getTask(int id) async {
    return await _taskRepository.getTask(id);
  }

  Future<void> addTask(Task task) async {
    return await _taskRepository.addTask(task);
  }

  Future<void> updateTask(Task task) async {
    return await _taskRepository.updateTask(task);
  }

  Future<void> deleteTask(String id) async {
    return await _taskRepository.removeTask(id);
  }

  Future<List<Task>> queryTask(String query) async {
    return await _taskRepository.queryTask(query);
  }
}
