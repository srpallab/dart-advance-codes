import 'dart:isolate';

import 'package:flutter/material.dart';

@immutable
class PeopleRequest {
  final ReceivePort rc;
  final Uri uri;

  const PeopleRequest(this.rc, this.uri);

  static Iterable<PeopleRequest> all() sync* {
    const mainUrl = "https://raw.githubusercontent.com/srpallab/vue-form-db/";
    for (final i in Iterable.generate(3, (i) => i)) {
      yield PeopleRequest(
        ReceivePort(),
        Uri.parse("${mainUrl}main/people${i + 1}.json"),
      );
    }
  }
}
