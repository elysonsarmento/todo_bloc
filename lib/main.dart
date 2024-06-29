import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/repositories/task_repository.dart';
import 'data/source/local/task_local.dart';
import 'domain/repositories/task_repositorie.dart';
import 'pages/todos_page/bloc/tasks_bloc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'domain/usecase/task_usecase.dart';
import 'pages/todos_page/todos_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TaskLocalImpl>(
          create: (context) => TaskLocalImpl(),
        ),
        RepositoryProvider<ITaskRepository>(
            create: (context) => TaskRepository(
                  context.read<TaskLocalImpl>(),
                )),
        RepositoryProvider<TaskUseCase>(
          create: (context) => TaskUseCase(
            context.read<ITaskRepository>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TasksBloc>(
            create: (context) => TasksBloc(
              context.read<TaskUseCase>(),
            )..add(LoadTasks()),
          ),
        ],
        child: MaterialApp(
          title: 'TO DO LIST',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: TodosPage(),
        ),
      ),
    );
  }
}
