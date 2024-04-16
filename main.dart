import 'package:flutter/material.dart';
import 'screen_2.dart';
import 'screen_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      home: ScreenOne(),
    );
 }
}

