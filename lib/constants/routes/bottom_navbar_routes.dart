import 'package:flutter/material.dart';

import '../../shared/models/layout/bottom_navbar_model.dart';
import 'routes.dart';

class BottomNavbarRoutes {
  static final List<BottomNavbarItemModel> _routes = [
    BottomNavbarItemModel(
      route: Routes.sharedPreferences,
      navbarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.display_settings),
        label: "Shared preferences",
      ),
    ),
    BottomNavbarItemModel(
      route: Routes.secureStorage,
      navbarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.security),
        label: "Secure storage",
      ),
    ),
    BottomNavbarItemModel(
      route: Routes.hive,
      navbarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.hive),
        label: "Hive library",
      ),
    ),
  ];

  static List<BottomNavbarItemModel> get routes => _routes;
}
