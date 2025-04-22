import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ParcialApp());
}

class ParcialApp extends StatelessWidget {
  const ParcialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}
