import 'dart:isolate';

import 'package:dart_advance_codes/people_request.dart';
import 'package:flutter/material.dart';

@immutable
class Request {
  final SendPort sendPort;
  final Uri uri;

  const Request(this.sendPort, this.uri);

  Request.from(PeopleRequest request)
      : sendPort = request.rc.sendPort,
        uri = request.uri;
}
