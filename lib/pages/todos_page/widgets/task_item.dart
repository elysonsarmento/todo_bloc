import 'package:flutter/material.dart';
import '../../../domain/entities/task_entity.dart';

class TodoItem extends StatefulWidget {
  final Task todo;
  final Function(bool) onCheckboxChanged;
  final Function(String) onEdit;
  const TodoItem({
    Key? key,
    required this.todo,
    required this.onCheckboxChanged,
    required this.onEdit,
  }) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            bool _error = false;
            textController.text = widget.todo.description ?? "";

            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: Text('Editar tarefa'),
                  content: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: _error ? "Campo não pode ficar vazio" : null,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (!_error) {
                          widget.onEdit(textController.text);

                          Navigator.pop(context);
                        }
                        setState(() {
                          _error = textController.text.isEmpty ? true : false;
                        });
                      },
                      child: Text('Salvar'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      leading: Checkbox(
        value: widget.todo.isCompleted,
        onChanged: (bool? checked) {
          widget.onCheckboxChanged(checked ?? false);
        },
      ),
      title: Text(widget.todo.description ?? ""),
    );
  }
}
