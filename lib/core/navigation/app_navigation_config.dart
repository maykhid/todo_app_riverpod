import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/core/navigation/app_routes.dart';

class AppRouterConfig {
  static GoRouter get goRouter => GoRouter(
        routes: AppRoutes.routes,
      );
}
