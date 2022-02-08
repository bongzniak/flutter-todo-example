import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter_todo_example/app/modules/todo/todo_controller.dart';
import 'package:flutter_todo_example/app/modules/todo/widgets/todo_list_widget.dart';

import '../../data/models/todo.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({Key? key}) : super(key: key);

  Widget _emptyList() {
    return const Center(
      child: Text("Todo Empty"),
    );
  }

  Widget _todoListView() {
    return ListView(
      children: List.generate(controller.todos.length, (index) {
        return TodoListWidget(
          todo: controller.todos[index],
          onChanged: (todo) {
            controller.updateTodo(todo.id, todo.title, !todo.isChecked);
          },
          showModalBottomSheet: (todo) {
            Get.bottomSheet(_bottomSheet(todo));
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo-Example"),
      ),
      body: Obx(
        () => SafeArea(
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2050, 12, 31),
                calendarFormat: CalendarFormat.week,
                focusedDay: controller.focusedDay.value,
                selectedDayPredicate: (day) {
                  return isSameDay(controller.focusedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.updateFocusDay(selectedDay);
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: controller.todos.isNotEmpty
                      ? _todoListView()
                      : _emptyList()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.dialog(_inputDialog(null));
        },
        label: const Text('+'),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _bottomSheet(Todo todo) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("수정하기"),
              onTap: () {
                Get.back();
                Get.dialog(_inputDialog(todo));
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text("삭제하기"),
              onTap: () {
                controller.delete(todo.id);
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _inputDialog(Todo? todo) {
    var editingController = TextEditingController();
    editingController.text = todo?.title ?? "";

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("할일추가"),
            TextField(controller: editingController, autofocus: true)
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("취소"),
        ),
        TextButton(
          onPressed: () {
            if (todo != null) {
              controller.updateTodo(
                  todo.id,
                  editingController.text,
                  todo.isChecked
              );
            } else {
              controller.save(editingController.text);
            }
            Get.back();
          },
          child: const Text("저장"),
        )
      ],
    );
  }
}
