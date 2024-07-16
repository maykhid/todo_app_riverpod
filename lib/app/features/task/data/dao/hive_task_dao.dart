import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_riverpod/app/features/task/data/dao/task_dao.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';


@Singleton(as: TaskDao)
class HiveTaskDao extends TaskDao {
  HiveTaskDao({
    required Box<Task> taskBox,
  }) : _taskBox = taskBox;

  final Box<Task> _taskBox;

  static const String _key = 'taskKey';

  @override
  void deleteTask(int taskIndex) => _taskBox.deleteAt(taskIndex);

  @override
  Task? readTask(int taskIndex) => _taskBox.getAt(taskIndex);

  @override
  bool get tasksExist => _taskBox.isNotEmpty;

  @override
  void writeTask(Task task) => _taskBox.add(task);

  @override
  void updateTask(Task task, int index ) => _taskBox.putAt(index, task);

  @override
  Tasks getAllTasks() => Tasks(tasks: _taskBox.values.toList());

  @override
  void deleteAllTasks() => _taskBox.clear();
}
