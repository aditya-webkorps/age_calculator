import 'package:age_calculator/lifecycle_methods_demo.dart';
import 'package:age_calculator/splash_page.dart';
import 'package:flutter/material.dart';
// import 'package:age_calculator/services/shared_pref_service.dart';

import 'age_calculator_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
