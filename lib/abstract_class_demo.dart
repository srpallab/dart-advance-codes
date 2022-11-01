import 'package:dart_advance_codes/extensions.dart';
import 'package:flutter/material.dart';

enum Type { cat, dog }

abstract class CanRun {
  final Type type;

  const CanRun({required this.type});

  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Cat extends CanRun {
  const Cat() : super(type: Type.cat);

  @override
  void run() {
    super.run();
    "Cat running is called".log();
  }
}

class Dog extends CanRun {
  const Dog() : super(type: Type.dog);
}

void testIt() {
  const Cat cat = Cat();
  cat.run();
  cat.type.log();
  const Dog dog = Dog();
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
