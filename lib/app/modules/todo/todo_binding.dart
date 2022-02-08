import 'package:get/get.dart';

import 'package:flutter_todo_example/app/data/provider/todo_storage_provider.dart';
import 'package:flutter_todo_example/app/data/services/todo_repository.dart';
import 'package:flutter_todo_example/app/modules/todo/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() =>
        TodoController(
            repository: TodoRepository(storageProvider: TodoStorageProvider())
        )
    );
  }
}