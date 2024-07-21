// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/features/task/data/task_repository.dart';

part 'task_controller.g.dart';

@riverpod

/// [TaskController] is basically our state manager handling state updates
/// for our Tasks/Todos.
///
/// Notice how the [Tasks] state from our [getTasksProvider] is updated. We update the state manually, simply to mitigate too many server 'fetches'
/// when the state changes. This however has it's downsides, for further info see:
///
/// https://riverpod.dev/docs/essentials/side_effects#updating-the-local-cache-manually
///
class TaskController extends _$TaskController {
  @override
  FutureOr<void> build() async {
    // return a value (or do nothing if the return type is void)
  }

  Future<void> deleteAllTasks() async {
    final taskRepository = ref.read(taskRepositoryProvider);
    final tasksProvider = ref.read(getTasksProvider.notifier);
    tasksProvider.state.value!.tasks.clear();
    await taskRepository.deleteAllTasks();
    // state = await AsyncValue.guard(() async {
    //   await taskRepository.deleteAllTasks();
    //   return state.value!..tasks.clear();
    // });
  }

  // Future<Tasks> getAllTasks() async {
  //   final taskRepository = ref.read(taskRepositoryProvider);
  //   return taskRepository.getAllTasks();
  // }

  Future<void> updateTask(Task task, int index) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    final tasksProvider = ref.read(getTasksProvider.notifier);
    state = const AsyncLoading();

    tasksProvider.state.value!
      ..tasks.removeAt(index)
      ..tasks.insert(index, task);

    state =
        await AsyncValue.guard(() => taskRepository.updateTask(task, index));

    if (state.hasError) {
      tasksProvider.ref.invalidateSelf();
      // ref.invalidateSelf();
    }

    // state = await AsyncValue.guard(() async {
    //   await taskRepository.updateTask(task, index);
    //   // return state.value!
    //   //   ..tasks.removeAt(index)
    //   //   ..tasks.insert(index, task);
    // });
  }

  void checkTask(Task task, int index) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    final tasksProvider = ref.read(getTasksProvider.notifier);
    state = const AsyncLoading();
    tasksProvider.state.value!
      ..tasks.removeAt(index)
      ..tasks.insert(index, task);

    state =
        await AsyncValue.guard(() => taskRepository.updateTask(task, index));

    if (state.hasError) {
      tasksProvider.ref.invalidateSelf();
      // ref.invalidateSelf();
    }

    // state = AsyncData(state.value!
    //   ..tasks.removeAt(index)
    //   ..tasks.insert(index, task));

    // await AsyncValue.guard(() async {
    //   taskRepository.updateTask(task, index).catchError((_) {
    //     ref.invalidateSelf();
    //   });
    // (error) {
    //   state = AsyncError(error, StackTrace.current);
    // };
    // });
  }

  Future<void> writeTask(Task task) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    final tasksProvider = ref.read(getTasksProvider.notifier);
    state = const AsyncLoading();
    
    tasksProvider.update((p0) => p0..tasks.add(task));

    state = await AsyncValue.guard(() => taskRepository.writeTask(task));

    if (state.hasError) {
      tasksProvider.ref.invalidateSelf();
      // ref.invalidateSelf();
    }
    // state = await AsyncValue.guard(() async {
    //   await taskRepository.writeTask(task);
    //   return state.value!..tasks.add(task);
    // });
  }

  Future<void> deleteTask(int index) async {
    final taskRepository = ref.read(taskRepositoryProvider);
    final tasksProvider = ref.read(getTasksProvider.notifier);
    state = const AsyncLoading();

    tasksProvider.update((p0) => p0..tasks.removeAt(index));
    // tasksProvider.state.value!.tasks.removeAt(index);
    // tasksProvider.mutateTasks(tasks);

    state = await AsyncValue.guard(() => taskRepository.deleteTask(index));

    if (state.hasError) {
      tasksProvider.ref.invalidateSelf();
      // ref.invalidateSelf();
    }
    // state = await AsyncValue.guard(() async {
    //   await taskRepository.deleteTask(index);
    //   return state.value!..tasks.removeAt(index);
    // });
  }
}

// @riverpod
// Future<Tasks> getTasks(GetTasksRef ref) async {
//   final taskRepository = ref.read(taskRepositoryProvider);
//   return taskRepository.getAllTasks();
// }


@riverpod
class GetTasks extends _$GetTasks {
  @override
  Future<Tasks> build() async {
    final taskRepository = ref.read(taskRepositoryProvider);
    return taskRepository.getAllTasks();
  }

  // Future<void> mutateTasks(Tasks tasks) async {
  //   final previousState = await future;
  //   state = AsyncData(tasks);
  // }

  // Future<>
}
