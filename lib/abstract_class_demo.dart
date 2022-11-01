import 'package:dart_advance_codes/extensions.dart';
import 'package:flutter/material.dart';

abstract class CanRun {
  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Cat extends CanRun {
  @override
  void run() {
    super.run();
    "Cat running is called".log();
  }
}

void testIt() {
  Cat cat = Cat();
  cat.run();
}

class AbstractClassDemo extends StatelessWidget {
  const AbstractClassDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Abstract Class Demo"),
      ),
    );
  }
}
