import 'package:flutter/material.dart';
import 'package:test_app1/home_page.dart';
import 'package:test_app1/list_view.dart';
import 'package:test_app1/test_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Testpage(),
    );
  }
}
