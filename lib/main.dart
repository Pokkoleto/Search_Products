import 'package:flutter/material.dart';
import 'modules/search/components/card_product.dart';
import 'package:tcc_1/modules/search/search_view.dart';
import 'package:tcc_1/modules/search/search_view_model.dart';
import 'package:tcc_1/modules/search/search_model.dart';

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
    return MaterialApp(
      home: SearchView(),
    );
  }
}
