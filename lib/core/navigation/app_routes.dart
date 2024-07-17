import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/features/task/ui/views/screens/add_task_screen.dart';
import 'package:todo_app_riverpod/app/features/task/ui/views/screens/edit_task_screen.dart';
import 'package:todo_app_riverpod/app/features/task/ui/views/screens/home_screen.dart';

class AppRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/addTask',
      name: 'addTAsk',
      builder: (context, state) => const AddTaskScreen(),
    ),
    GoRoute(
      path: '/editTask',
      name: 'editTask',
      builder: (context, state) {
        final taskProps = state.extra! as TaskProps;
        return EditTaskScreen(
          taskProps: taskProps,
        );
      },
    ),
  ];
}
