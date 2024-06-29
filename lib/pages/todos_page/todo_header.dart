import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/tasks_bloc.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Atividades',
          style: TextStyle(fontSize: 40.0),
        ),
        BlocListener<TasksBloc, TasksState>(
          listener: (context, state) {
            if (state is TasksLoaded) {}
          },
          child: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return Text(
                '${state.tasks.length} atividade',
                style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
              );
            },
          ),
        ),
      ],
    );
  }
}
