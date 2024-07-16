// ignore_for_file: invalid_annotation_target

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';

@module
abstract class RegisterModule {
  // @singleton
  @preResolve
  Future<Box<Task>> get taskBox async{
    return Hive.openBox<Task>('taskbox');
  }
}
