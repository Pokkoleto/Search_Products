import 'package:flutter/material.dart';
import './modules/search/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _BodyState();
}

class _BodyState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchView(),
    );
  }
}
