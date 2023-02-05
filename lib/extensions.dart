import 'dart:developer' as devtools show log;
import 'dart:io';

extension Log on Object {
  void log() => devtools.log(toString());
}

extension GetCallOnUri on Object {
  Future<HttpClientResponse> getUrl(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((HttpClientRequest request) => request.close());
}
