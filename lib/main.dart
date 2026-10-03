import 'package:healthapp/presentation/screens/navigatorScreen/main_navigator_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: MainNavigationScreen(),
    );
  }
}

