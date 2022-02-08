import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_todo_example/app/data/models/todo.dart';

class TodoListWidget extends StatefulWidget {
  final Todo todo;
  final Function(Todo) onChanged;
  final Function(Todo) showModalBottomSheet;

  const TodoListWidget({
    Key? key,
    required this.todo,
    required this.onChanged,
    required this.showModalBottomSheet,
  }) : super(key: key);

  @override
  _TodoListWidgetState createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Checkbox(
            value: widget.todo.isChecked,
            onChanged: (value) {
              widget.onChanged(widget.todo);
            },
          ),
          Expanded(
            child: Text(
              widget.todo.title,
              style: widget.todo.isChecked
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : const TextStyle(decoration: TextDecoration.none),
            ),
          ),
          IconButton(
              onPressed: () {
                widget.showModalBottomSheet(widget.todo);
              },
              icon: const Icon(Icons.more_horiz)
          ),
        ],
      ),
    );
  }
}
