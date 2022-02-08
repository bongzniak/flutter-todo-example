// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Todo extends _Todo with RealmObject {
  Todo(
    int id,
    bool isChecked,
    String title,
    String createdDate,
  ) {
    RealmObject.set(this, 'id', id);
    this.isChecked = isChecked;
    this.title = title;
    this.createdDate = createdDate;
  }

  Todo._();

  @override
  int get id => RealmObject.get<int>(this, 'id') as int;
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  bool get isChecked => RealmObject.get<bool>(this, 'isChecked') as bool;
  @override
  set isChecked(bool value) => RealmObject.set(this, 'isChecked', value);

  @override
  String get title => RealmObject.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObject.set(this, 'title', value);

  @override
  String get createdDate =>
      RealmObject.get<String>(this, 'createdDate') as String;
  @override
  set createdDate(String value) => RealmObject.set(this, 'createdDate', value);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Todo._);
    return const SchemaObject(Todo, [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('isChecked', RealmPropertyType.bool),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('createdDate', RealmPropertyType.string),
    ]);
  }
}
