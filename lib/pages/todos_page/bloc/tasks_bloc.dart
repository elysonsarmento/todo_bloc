import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../utils/enums/filter_enum.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/usecase/task_usecase.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TaskUseCase _taskUseCase;

  TasksBloc(this._taskUseCase) : super(TasksState()) {
    on<TasksEvent>((event, emit) async {
      emit(TasksLoading());
      final tasks = await _fetchTask();
      emit(TasksLoaded(tasks: tasks));
    });

    on<LoadTasks>((event, emit) async {
      emit(TasksLoading());
      final tasks = await _fetchTask();
      emit(TasksLoaded(tasks: tasks));
    });

    on<FilterTasks>((event, emit) async {
      final filter = event.filter;
      emit(TasksLoading());
      final tasks = await _fetchTask();
      final filteredTasks = _filterTasks(tasks, filter);
      emit(TasksLoaded(tasks: filteredTasks, filter: event.filter));
    });

    on<UpdateTask>((event, emit) async {
      final task = event.task;
      await _taskUseCase.updateTask(task);
      final tasks = await _fetchTask();
      emit(TasksLoaded(tasks: tasks));
    });

    on<AddTask>((event, emit) async {
      final task = event.task;
      await _taskUseCase.addTask(task);
      final tasks = await _fetchTask();
      emit(TasksLoaded(tasks: tasks));
    });

    on<SeachTasks>((event, emit) async {
      final query = event.query;
      emit(TasksLoading());
      final tasks = await _searchTasks(query);

      emit(TasksLoaded(tasks: tasks));
    });

    on<DeleteTask>((event, emit) async {
      final task = event.task;
      await _taskUseCase.deleteTask(task.taskId!);
      final tasks = await _fetchTask();
      emit(TasksLoaded(tasks: tasks));
    });
  }

  Future<List<Task>> _fetchTask() async {
    return await _taskUseCase.getTasks();
  }

  List<Task> _filterTasks(List<Task> tasks, Filter filter) {
    switch (filter) {
      case Filter.all:
        return tasks;
      case Filter.active:
        return tasks.where((task) => !task.isCompleted).toList();
      case Filter.completed:
        return tasks.where((task) => task.isCompleted).toList();
    }
  }

  Future<List<Task>> _searchTasks(String query) async {
    return await _taskUseCase.queryTask(query);
  }
}
