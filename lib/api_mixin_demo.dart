import 'dart:convert';
import 'dart:io';

import 'package:dart_advance_codes/extensions.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

extension GetCallOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((HttpClientRequest request) => request.close());
}

mixin CanMakeGetCall {
  String get url;
  @useResult
  Future<String> getString() => getUrl(url).then(
        (HttpClientResponse response) =>
            response.transform(utf8.decoder).join(),
      );
}

@immutable
class GetEvents with CanMakeGetCall {
  const GetEvents();
  @override
  String get url =>
      'https://raw.githubusercontent.com/srpallab/vue-form-db/main/db.json';
}

void testIt() async {
  final events = await const GetEvents().getString();
  events.log();
}

class ApiMixinDemo extends StatelessWidget {
  const ApiMixinDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API Mixins Demo"),
      ),
    );
  }
}
