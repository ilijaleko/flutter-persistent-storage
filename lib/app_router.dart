import 'package:flutter/material.dart';
import 'constants/routes/routes.dart';
import 'screens/hive_screen.dart';
import 'screens/shared_preferences_screen.dart';
import 'screens/secure_storage_screen.dart';
import 'shared/widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final routerConfig = GoRouter(
    initialLocation: Routes.sharedPreferences,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: const BottomNavbarWidget(),
              body: child);
        },
        routes: [
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: Routes.sharedPreferences,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SharedPreferencesScreen())),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: Routes.secureStorage,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SecureStorageScreen())),
          GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: Routes.hive,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HiveScreen())),
        ],
      ),
    ],
  );
}
