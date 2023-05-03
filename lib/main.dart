import 'package:flutter/material.dart';
import 'package:muslim_app/config/theme/app_theme.dart';
import 'package:muslim_app/presentation/pages/intro/getting_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: GettingStartedPage(),
    );
  }
}
