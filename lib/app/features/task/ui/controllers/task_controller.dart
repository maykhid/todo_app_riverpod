import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/features/task/data/task_repository.dart';

part 'task_controller.g.dart';

@riverpod
class TaskController extends _$TaskController {
  @override
  Tasks build() {
    // return a value (or do nothing if the return type is void)
    return getAllTasks();
  }

  void deleteAllTasks() {
    final taskRepository = ref.read(taskRepositoryProvider);
    taskRepository.deleteAllTasks();
    state = getAllTasks();
  }

  Tasks getAllTasks() {
    final taskRepository = ref.read(taskRepositoryProvider);
    return taskRepository.getAllTasks();
  }

  void updateTask(Task task, int index) {
    final taskRepository = ref.read(taskRepositoryProvider);
    taskRepository.updateTask(task, index);
    state = getAllTasks();
  }

  void writeTask(Task task) {
    final taskRepository = ref.read(taskRepositoryProvider);
    taskRepository.writeTask(task);
    state = getAllTasks();
    // ref.invalidate(taskRepositoryProvider);
  }

  void deleteTask(int index) {
    final taskRepository = ref.read(taskRepositoryProvider);
    taskRepository.deleteTask(index);
    state = getAllTasks();
    // ref.invalidate(taskRepositoryProvider);
  }
}
