import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/tasks_bloc.dart';

import 'create_todo.dart';
import 'search_and_filter_todo.dart';
import 'show_todos.dart';
import 'todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((TasksBloc bloc) => bloc.state);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                TodoHeader(),
                CreateTodo(),
                SizedBox(height: 20.0),
                SearchAndFilterTodo(),
                state == TasksLoading()
                    ? const Center(child: CircularProgressIndicator())
                    : ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
