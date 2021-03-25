import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:send_on_lan/protobuf_gen/text.pbgrpc.dart';

class MyService extends CCServiceBase {
  static List messages = [];

  @override
  Stream<OneMessage> send(ServiceCall call, Stream<OneMessage> request) {
    request.listen((event) {
      messages.add(event.value);
    });
    print(call.clientMetadata);
    return Stream.empty();
  }
}
