import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_riverpod/app/features/task/data/model/task.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_colors.dart';
import 'package:todo_app_riverpod/core/di/di.dart';
import 'package:todo_app_riverpod/core/navigation/app_navigation_config.dart';

void main() async {
  await setup();
  runApp(const ProviderScope(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lightBlue),
        useMaterial3: false,
      ),
      routerConfig: AppRouterConfig.goRouter,
    );
  }
}

setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  var path = '/assets/db';
  // i test on web using developer tools mobile screens hence the check
  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    path = appDocDir.path;
  }
  // final dir = await getApplicationDocumentsDirectory();
  final dbPath = join(path, '.db.hive');
  await Hive.initFlutter(dbPath);

  Hive
    ..registerAdapter(TaskAdapter())
    ..registerAdapter(TasksAdapter());

  await initDependencies();
}
