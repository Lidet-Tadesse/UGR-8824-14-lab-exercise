import 'package:flutter/material.dart';

void main() {
  runApp(ScreenTwo());
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = 
      ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Back"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}


