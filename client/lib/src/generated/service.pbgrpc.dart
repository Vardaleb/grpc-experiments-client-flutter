//
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'demo_request.pb.dart' as $0;
import 'demo_response.pb.dart' as $1;

export 'service.pb.dart';

@$pb.GrpcServiceName('demo.DemoService')
class DemoServiceClient extends $grpc.Client {
  static final _$unary = $grpc.ClientMethod<$0.DemoRequest, $1.DemoResponse>(
      '/demo.DemoService/Unary',
      ($0.DemoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DemoResponse.fromBuffer(value));
  static final _$serverStreaming = $grpc.ClientMethod<$0.DemoRequest, $1.DemoResponse>(
      '/demo.DemoService/ServerStreaming',
      ($0.DemoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DemoResponse.fromBuffer(value));
  static final _$clientStreaming = $grpc.ClientMethod<$0.DemoRequest, $1.DemoResponse>(
      '/demo.DemoService/ClientStreaming',
      ($0.DemoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DemoResponse.fromBuffer(value));
  static final _$bidirectionalStreaming = $grpc.ClientMethod<$0.DemoRequest, $1.DemoResponse>(
      '/demo.DemoService/BidirectionalStreaming',
      ($0.DemoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DemoResponse.fromBuffer(value));

  DemoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.DemoResponse> unary($0.DemoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unary, request, options: options);
  }

  $grpc.ResponseStream<$1.DemoResponse> serverStreaming($0.DemoRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$serverStreaming, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$1.DemoResponse> clientStreaming($async.Stream<$0.DemoRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$clientStreaming, request, options: options).single;
  }

  $grpc.ResponseStream<$1.DemoResponse> bidirectionalStreaming($async.Stream<$0.DemoRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$bidirectionalStreaming, request, options: options);
  }
}

@$pb.GrpcServiceName('demo.DemoService')
abstract class DemoServiceBase extends $grpc.Service {
  $core.String get $name => 'demo.DemoService';

  DemoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DemoRequest, $1.DemoResponse>(
        'Unary',
        unary_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DemoRequest.fromBuffer(value),
        ($1.DemoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DemoRequest, $1.DemoResponse>(
        'ServerStreaming',
        serverStreaming_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DemoRequest.fromBuffer(value),
        ($1.DemoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DemoRequest, $1.DemoResponse>(
        'ClientStreaming',
        clientStreaming,
        true,
        false,
        ($core.List<$core.int> value) => $0.DemoRequest.fromBuffer(value),
        ($1.DemoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DemoRequest, $1.DemoResponse>(
        'BidirectionalStreaming',
        bidirectionalStreaming,
        true,
        true,
        ($core.List<$core.int> value) => $0.DemoRequest.fromBuffer(value),
        ($1.DemoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.DemoResponse> unary_Pre($grpc.ServiceCall call, $async.Future<$0.DemoRequest> request) async {
    return unary(call, await request);
  }

  $async.Stream<$1.DemoResponse> serverStreaming_Pre($grpc.ServiceCall call, $async.Future<$0.DemoRequest> request) async* {
    yield* serverStreaming(call, await request);
  }

  $async.Future<$1.DemoResponse> unary($grpc.ServiceCall call, $0.DemoRequest request);
  $async.Stream<$1.DemoResponse> serverStreaming($grpc.ServiceCall call, $0.DemoRequest request);
  $async.Future<$1.DemoResponse> clientStreaming($grpc.ServiceCall call, $async.Stream<$0.DemoRequest> request);
  $async.Stream<$1.DemoResponse> bidirectionalStreaming($grpc.ServiceCall call, $async.Stream<$0.DemoRequest> request);
}
