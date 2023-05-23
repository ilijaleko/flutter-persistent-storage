import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_router.dart';
import 'hive/models/bootcamp_lecture_model.dart';

void main() async {
  // Initialize Hive, register adapter and open box
  await Hive.initFlutter();
  Hive.registerAdapter(BootcampLectureAdapter());
  await Hive.openBox<BootcampLecture>('bootcamp_lecture');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Bootcamp',
      routerConfig: AppRouter.routerConfig,
    );
  }
}
