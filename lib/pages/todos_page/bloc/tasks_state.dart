part of 'tasks_bloc.dart';

enum TasksStatus { initial, loading, success, failure }

class TasksState extends Equatable {
  final List<Task> tasks;
  final int activeTodoCount;
  final TasksStatus status;
  final Filter filter;

  const TasksState({
    this.filter = Filter.completed,
    this.activeTodoCount = 0,
    this.tasks = const [],
    this.status = TasksStatus.initial,
  });

  @override
  List<Object> get props => [
        tasks,
        activeTodoCount,
        status,
        filter,
      ];
}

class TasksLoaded extends TasksState {
  final List<Task> tasks;
  final Filter filter;

  TasksLoaded({this.tasks = const [], this.filter = Filter.all})
      : super(tasks: tasks, filter: filter);

  @override
  List<Object> get props => [tasks, filter];
}

class TasksLoading extends TasksState {}
