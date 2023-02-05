import 'dart:convert';
import 'dart:isolate';

import 'package:dart_advance_codes/extensions.dart';
import 'package:dart_advance_codes/person.dart';
import 'package:flutter/material.dart';

Future<Iterable<Person>> getPersons() async {
  final ReceivePort rp = ReceivePort();
  await Isolate.spawn(_getPersons, rp.sendPort);
  return await rp.first;
}

void _getPersons(SendPort sp) async {
  const url =
      'https://raw.githubusercontent.com/srpallab/vue-form-db/main/person.json';
  final persons = await ''
      .getUrl(url)
      .then((response) => response.transform(utf8.decoder).join())
      .then((jsonString) => json.decode(jsonString) as List<dynamic>)
      .then((listJson) => listJson.map((map) => Person.formJson(map)));
  // persons.log();
  // sp.send(persons);
  Isolate.exit(sp, persons);
}

class TestingIsolates extends StatelessWidget {
  const TestingIsolates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final persons = await getPersons();
            persons.log();
          },
          child: const Text("Press ME"),
        ),
      ),
    );
  }
}
