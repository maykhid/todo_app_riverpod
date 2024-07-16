import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/app/features/task/data/dao/task_dao.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/core/di/di.dart';

part 'task_repository.g.dart';

@singleton
class TaskRepository {
  TaskRepository({required TaskDao taskDao}) : _taskDao = taskDao;

  final TaskDao _taskDao;

  Tasks getAllTasks() {
    return _taskDao.getAllTasks();
  }

  void deleteAllTasks() {
    _taskDao.deleteAllTasks();
  }

  Task? readTask(int taskIndex) {
    return _taskDao.readTask(taskIndex);
  }

  void updateTask(Task newTask, int taskIndex) {
    _taskDao.updateTask(newTask, taskIndex);
  }

  void writeTask(Task newTask) {
    _taskDao.writeTask(newTask);
  }

  void deleteTask(int index) {
    _taskDao.deleteTask(index);
  }
}

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  // final taskRepository = TaskRepository(taskDao: locator<TaskDao>());
  return TaskRepository(taskDao: locator<TaskDao>());
}
