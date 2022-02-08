import 'package:flutter/material.dart';
import 'package:flutter_todo_example/app/core/theme/app_theme.dart';
import 'package:get/get.dart';

import 'package:flutter_todo_example/app/routes/app_pages.dart';
import 'package:flutter_todo_example/app/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Todo Example',
      initialRoute: AppRoutes.todo,
      getPages: AppPages.list,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
