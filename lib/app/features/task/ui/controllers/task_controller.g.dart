// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskControllerHash() => r'e181fda444dd15c60f98cc094485b9d0041bed9d';

/// [TaskController] is basically our state manager handling state updates
/// for our Tasks/Todos.
///
/// Notice how the [Tasks] state from our [getTasksProvider] is updated. We update the state manually, simply to mitigate too many server 'fetches'
/// when the state changes. This however has it's downsides, for further info see:
///
/// https://riverpod.dev/docs/essentials/side_effects#updating-the-local-cache-manually
///
///
/// Copied from [TaskController].
@ProviderFor(TaskController)
final taskControllerProvider =
    AutoDisposeAsyncNotifierProvider<TaskController, void>.internal(
  TaskController.new,
  name: r'taskControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskController = AutoDisposeAsyncNotifier<void>;
String _$getTasksHash() => r'1c8ec49c76aace24e52a05ed6ad26a22c209f7b2';

/// See also [GetTasks].
@ProviderFor(GetTasks)
final getTasksProvider =
    AutoDisposeAsyncNotifierProvider<GetTasks, Tasks>.internal(
  GetTasks.new,
  name: r'getTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetTasks = AutoDisposeAsyncNotifier<Tasks>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
