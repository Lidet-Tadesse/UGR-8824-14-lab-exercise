import 'package:flutter/material.dart';
import 'screen_2.dart';

void main() {
  runApp(ScreenOne());
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen One"),
      ),
      body: Center(
        child: ElevatedButton (
          child: const Text("Next"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute (
                builder: (BuildContext context) => ScreenTwo(),
                settings: const RouteSettings(arguments: "text data")));
                
          }),
        ),
    );
  }
}

