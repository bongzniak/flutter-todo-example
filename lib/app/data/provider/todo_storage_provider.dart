import 'package:get/get.dart';

import 'package:flutter_todo_example/app/data/models/todo.dart';
import 'package:realm/realm.dart';

class TodoStorageProvider {

  final _realm = Realm(Configuration([Todo.schema]));

  Future<List<Todo>> load(String targetDate) {
    List<Todo> list = _realm
        .all<Todo>()
        .where((element) => element.createdDate == targetDate)
        .toList();

    return Future.value(list);
  }

  Future<Todo> save(String title, String targetDate) {
    final Todo todo = Todo(
        DateTime.now().millisecondsSinceEpoch,
        false,
        title,
        targetDate
    );

    _realm.write(() {
      _realm.add(todo);
    });

    return Future.value(todo);
  }

  Future<Todo?> update(int id, String title, bool isChecked) {
    Todo? todo = _realm.find<Todo>(id);

    _realm.write(() {
      todo?.title = title;
      todo?.isChecked = isChecked;
    });

    return Future.value(todo);
  }

  Future<int> delete(int id) {
    Todo? todo = _realm.find<Todo>(id);

    _realm.write(() {
      if (todo != null) {
        _realm.delete(todo);
      }
    });

    return Future.value(id);
  }
}
