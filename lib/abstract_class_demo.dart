import 'package:dart_advance_codes/extensions.dart';
import 'package:flutter/material.dart';

abstract class CanRun {
  String get type {
    if (this is Cat) {
      return "cat";
    } else {
      return "Something else";
    }
  }

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

class Dog extends CanRun {}

void testIt() {
  Cat cat = Cat();
  cat.run();
  cat.type.log();
  Dog dog = Dog();
  dog.run();
  dog.type.log();
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
