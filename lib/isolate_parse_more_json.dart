import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:async/async.dart';
import 'package:dart_advance_codes/extensions.dart';
import 'package:dart_advance_codes/people_request.dart';
import 'package:dart_advance_codes/person.dart';
import 'package:dart_advance_codes/request.dart';
import 'package:flutter/material.dart';

Stream<Iterable<Person>> getPeoples() {
  final streams = PeopleRequest.all().map((req) =>
      Isolate.spawn(_getPeoples, Request.from(req))
          .asStream()
          .asyncExpand((_) => req.rc)
          .takeWhile((element) => element is Iterable<Person>)
          .cast());
  return StreamGroup.merge(streams).cast();
}

void _getPeoples(Request request) async {
  final people = await HttpClient()
      .getUrl(request.uri)
      .then((req) => req.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((jsonString) => json.decode(jsonString) as List<dynamic>)
      .then((listJson) => listJson.map((json) => Person.formJson(json)));
  request.sendPort.send(people);
}

void testIt() async {
  await for (final msg in getPeoples()) {
    msg.log();
  }
}

class IsolateParseMoreJson extends StatelessWidget {
  const IsolateParseMoreJson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            testIt();
          },
          child: const Text("Test"),
        ),
      ),
    );
  }
}
