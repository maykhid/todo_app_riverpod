import 'package:injectable/injectable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/app/features/task/data/dao/task_dao.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/core/di/di.dart';

part 'task_repository.g.dart';

@singleton
/// [TaskRepository] here tries to mimic asynchronous tasks similar 
/// to how it would look if our crud functions were getting it's data
/// from a server. So we are assuming the data fetched here is coming 
/// from a server somewhere far, far away, from a distant land 🌚
/// 
class TaskRepository {
  TaskRepository({required TaskDao taskDao}) : _taskDao = taskDao;

  final TaskDao _taskDao;

  static const _duration = Duration(seconds: 2);

  Future<Tasks> getAllTasks() async {
    await Future.delayed(_duration);
    return _taskDao.getAllTasks();
  }

  Future<void> deleteAllTasks() async {
    await Future.delayed(_duration);
    _taskDao.deleteAllTasks();
  }

  Future<Task?> readTask(int taskIndex) async {
    await Future.delayed(_duration);
    return _taskDao.readTask(taskIndex);
  }

  Future<void> updateTask(Task newTask, int taskIndex) async {
    await Future.delayed(_duration);
    _taskDao.updateTask(newTask, taskIndex);
  }

  Future<void> writeTask(Task newTask) async {
    await Future.delayed(_duration);
    _taskDao.writeTask(newTask);
  }

  Future<void> deleteTask(int index) async {
   await Future.delayed(_duration);
    _taskDao.deleteTask(index);
  }
}

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  // final taskRepository = TaskRepository(taskDao: locator<TaskDao>());
  return TaskRepository(taskDao: locator<TaskDao>());
}
