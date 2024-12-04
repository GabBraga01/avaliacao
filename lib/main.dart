import 'package:flutter/material.dart';
import 'package:avaliacao/Views/home_page.dart';
import 'package:avaliacao/Views/theme.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      home: const HomePage()
    );
  }
}
