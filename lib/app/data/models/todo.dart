import 'package:realm/realm.dart';

part 'todo.g.dart';

@RealmModel()
class _Todo {
  @PrimaryKey()
  late final int id;

  late bool isChecked;
  late String title;

  late String createdDate;
}