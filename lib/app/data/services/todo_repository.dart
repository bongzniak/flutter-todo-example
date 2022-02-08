import 'package:flutter_todo_example/app/data/provider/todo_storage_provider.dart';
import 'package:flutter_todo_example/app/data/models/todo.dart';

abstract class ITodoRepository {
  Future<List<Todo>> load(String targetDate);
  Future<Todo> save(String title, String targetDate);
  Future<Todo?> update(int id, String title, bool isChecked);
  Future<int> delete(int id);
}

class TodoRepository implements ITodoRepository {

  TodoStorageProvider storageProvider;

  TodoRepository({required this.storageProvider});

  @override
  Future<List<Todo>> load(String targetDate) {
    return storageProvider.load(targetDate);
  }

  @override
  Future<Todo> save(String title, String targetDate) {
    return storageProvider.save(title, targetDate);
  }

  @override
  Future<Todo?> update(int id, String title, bool isChecked) {
    return storageProvider.update(id, title, isChecked);
  }

  @override
  Future<int> delete(int id) {
    return storageProvider.delete(id);
  }
}
