import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/pages/tab_nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const TabNavigation(),
    );
  }
}
