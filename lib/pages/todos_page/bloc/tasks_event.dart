part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TasksEvent {}

class FilterTasks extends TasksEvent {
  final Filter filter;

  FilterTasks({required this.filter});

  @override
  List<Object> get props => [filter];
}

class UpdateTask extends TasksEvent {
  final Task task;

  UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}

class AddTask extends TasksEvent {
  final Task task;

  AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class SeachTasks extends TasksEvent {
  final String query;

  SeachTasks({required this.query});

  @override
  List<Object> get props => [query];
}

class DeleteTask extends TasksEvent {
  final Task task;

  DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}
