import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/routes/bottom_navbar_routes.dart';
import '../../models/layout/bottom_navbar_model.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key});

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  static final List<BottomNavbarItemModel> _mainRoutes =
      BottomNavbarRoutes.routes;

  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      context.go(_mainRoutes[index].route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey))),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        items: _mainRoutes.map((e) => e.navbarItem).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
