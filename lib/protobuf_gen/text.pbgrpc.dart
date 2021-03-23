///
//  Generated code. Do not modify.
//  source: text.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'text.pb.dart' as $0;
export 'text.pb.dart';

class CCClient extends $grpc.Client {
  static final _$send = $grpc.ClientMethod<$0.OneMessage, $0.OneMessage>(
      '/CC/send',
      ($0.OneMessage value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.OneMessage.fromBuffer(value));

  CCClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.OneMessage> send($async.Stream<$0.OneMessage> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$send, request, options: options);
  }
}

abstract class CCServiceBase extends $grpc.Service {
  $core.String get $name => 'CC';

  CCServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.OneMessage, $0.OneMessage>(
        'send',
        send,
        true,
        true,
        ($core.List<$core.int> value) => $0.OneMessage.fromBuffer(value),
        ($0.OneMessage value) => value.writeToBuffer()));
  }

  $async.Stream<$0.OneMessage> send(
      $grpc.ServiceCall call, $async.Stream<$0.OneMessage> request);
}
