// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Client to basic_writer_server.dart.
// Makes a POST request containing JSON-encoded data
// to the server and prints the response.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

String _host = InternetAddress.loopbackIPv4.host;
String path = 'file.txt';

Map jsonData = {
  'name': 'Han Solo',
  'job': 'reluctant hero',
  'BFF': 'Chewbacca',
  'ship': 'Millennium Falcon',
  'weakness': 'smuggling debts'
};

Future main() async {
  final request = await HttpClient().post(_host, 4049, path) /*1*/
    ..headers.contentType = ContentType.json /*2*/
    ..write(jsonEncode(jsonData)); /*3*/
  final response = await request.close(); /*4*/
  await utf8.decoder.bind(response /*5*/).forEach(print);
}
