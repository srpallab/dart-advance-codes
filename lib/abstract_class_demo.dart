import 'package:flutter/material.dart';

abstract class CanRun {
  void run();
}

class Cat extends CanRun {
  @override
  void run() {
    // TODO: implement run
  }
}

class AbstractClassDemo extends StatelessWidget {
  const AbstractClassDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Abstract Class Demo"),
      ),
    );
  }
}
