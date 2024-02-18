import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("inside splash screen");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pizzario'),
        ),
        body: Container(
          child: Center(child: Text("Test")),
        ));
  }
}
