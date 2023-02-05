import 'dart:isolate';

import 'package:dart_advance_codes/extensions.dart';
import 'package:flutter/material.dart';

Stream<String> getMessages() {
  final ReceivePort rp = ReceivePort();
  return Isolate.spawn(_getMessages, rp.sendPort)
      .asStream()
      .asyncExpand((_) => rp)
      .takeWhile((element) => element is String)
      .cast();
}

void _getMessages(SendPort sp) async {
  await for (final now in Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now().toIso8601String(),
  ).take(10)) {
    sp.send(now);
  }
  Isolate.exit(sp);
}

void testIt() async {
  await for (final msg in getMessages()) {
    msg.log();
  }
}

class IsolatesStreams extends StatelessWidget {
  const IsolatesStreams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              testIt();
            },
            child: const Text("Test It")),
      ),
    );
  }
}
