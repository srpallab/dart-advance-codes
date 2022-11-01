import 'package:dart_advance_codes/extensions.dart';
import 'package:flutter/material.dart';

mixin CanRun {
  int get speed;
  void run() {
    "Running with the speed of ${speed}km/h".log();
  }
}

class Cat with CanRun {
  @override
  int speed = 10;
}

void testIt() {
  Cat cat = Cat();
  cat.run();
  cat.speed = 20;
  cat.run();
}

class MixinsDemo extends StatelessWidget {
  const MixinsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mixins Demo"),
      ),
    );
  }
}
