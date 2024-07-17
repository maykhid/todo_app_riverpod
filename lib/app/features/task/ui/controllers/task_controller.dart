import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/features/task/data/task_repository.dart';

part 'task_controller.g.dart';

@riverpod
class TaskController extends _$TaskController {
  @override
  FutureOr<Tasks> build() {
    // return a value (or do nothing if the return type is void)
    return getAllTasks();
  }

  Future<void> deleteAllTasks() async {
    final taskRepository = ref.read(taskRepositoryProvider);
    state = await AsyncValue.guard(() async {
      await taskRepository.deleteAllTasks();
      return state.value!..tasks.clear();
    });
  }

  Future<Tasks> getAllTasks() async {
    final taskRepository = ref.read(taskRepositoryProvider);
    return taskRepository.getAllTasks();
  }

  Future<void> updateTask(Task task, int index) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await taskRepository.updateTask(task, index);
      return state.value!
        ..tasks.removeAt(index)
        ..tasks.insert(index, task);
    });
  }

  Future<void> writeTask(Task task) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await taskRepository.writeTask(task);
      return state.value!..tasks.add(task);
    });
  }

  Future<void> deleteTask(int index) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await taskRepository.deleteTask(index);
      return state.value!..tasks.removeAt(index);
    });
  }
}
