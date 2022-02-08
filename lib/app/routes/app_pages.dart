import 'package:get/get.dart';

import 'package:flutter_todo_example/app/modules/todo/todo_binding.dart';
import 'package:flutter_todo_example/app/routes/app_routes.dart';
import 'package:flutter_todo_example/app/modules/todo/todo_page.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.todo,
      page: () => const TodoPage(),
      binding: TodoBinding(),
    ),
  ];
}