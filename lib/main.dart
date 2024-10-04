import 'package:flutter/material.dart';
import 'package:movies/core/services/service_locator.dart';
import 'package:movies/core/utils/app_string.dart';
import 'package:movies/features/movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}

