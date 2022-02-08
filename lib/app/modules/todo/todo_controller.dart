import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter_todo_example/app/data/services/todo_repository.dart';
import 'package:flutter_todo_example/app/data/models/todo.dart';

class TodoController extends GetxController {

  static TodoController get to => Get.find();

  TodoController({required this.repository});

  late ITodoRepository repository;

  RxList todos = <Todo>[].obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  String get targetDate => DateFormat('yyyy-MM-dd').format(focusedDay.value);

  @override
  void onInit() {
    super.onInit();

    load();
  }

  void load() async {
    List<Todo> list = await repository.load(targetDate);
    todos.addAll(list);
    todos.sort((a, b) => a.id.compareTo(b.id));
    todos.sort((a, b) => a.isChecked ? 1 : -1);
  }

  void save(String title) async {
    Todo todo = await repository.save(title, targetDate);
    todos.insert(0, todo);
  }

  void updateTodo(int id, String title, bool isChecked) async {
    Todo? todo = await repository.update(id, title, isChecked);
    if (todo != null) {
      final int index = todos.indexWhere((element) => element.id == id);
      if (index != -1) {
        todos[index] = todo;
        todos.sort((a, b) => a.id.compareTo(b.id));
        todos.sort((a, b) => a.isChecked ? 1 : -1);
      }
    }
  }

  void delete(int id) async {
    int deleteID = await repository.delete(id);
    updateFocusDay(focusedDay.value);
  }

  void updateFocusDay(DateTime selectedDay) {
    todos.clear();

    focusedDay(selectedDay);
    load();
  }
}