import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Tasks extends Equatable{
  const Tasks({required this.tasks});

  factory Tasks.fromJson(List<Task> tasks) => Tasks(tasks: tasks);
  
  @HiveField(0)
  final List<Task> tasks;

  @override
  String toString() => tasks.toString();
  
  @override
  List<Object?> get props => [tasks];
}

@HiveType(typeId: 2)
class Task extends Equatable{
  const Task({required this.title, required this.isDone});

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isDone;
  
  @override
  List<Object?> get props => [title, isDone];
}
