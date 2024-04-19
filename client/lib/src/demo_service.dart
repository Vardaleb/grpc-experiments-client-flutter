import 'package:client/src/generated/demo_request.pb.dart';
import 'package:client/src/generated/service.pbgrpc.dart';
import 'package:client/src/log.dart';
import 'package:grpc/grpc.dart';

class DemoService {
  static final DemoService _instance = DemoService._internal();
  late ClientChannel _channel;
  late DemoServiceClient _stub;

  DemoService._internal() {
    _init();
  }

  String _host = 'localhost';
  int _port = 50051;
  void _init() {
    _channel = ClientChannel(_host,
        port: _port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));
    _stub = DemoServiceClient(_channel);
  }

  factory DemoService() => _instance;

  static DemoService get instance => _instance;
  DemoServiceClient get stub => _stub;

  set host(String value) => _host = value;
  set port(int value) => _port = value;

  Future<void> reconnect() async {
    await _channel.shutdown();
    _init();
  }

  Future<String> unary() async {
    String result = "";
    try {
      var time = DateTime.now().toString();
      var response = await stub.unary(DemoRequest()..query = time);
      result = "-> $time\n<- ${response.result}";
    } catch (e) {
      Log.instance.e(e);
    }
    return result;
  }

  serverStreaming() async {
    String result = "";
    try {
      var time = DateTime.now().toString();
      var responses = stub.serverStreaming(DemoRequest()..query = time);
      result = "-> $time\n";
      await for (var response in responses) {
        result = "$result<-${response.result}\n";
      }
    } catch (e) {
      Log.instance.e(e);
    }
    return result;
  }

  Future<String> clientStreaming() async {
    String result = "";
    try {
      Stream<DemoRequest> createRequest() async* {
        var letters = ["A", "B", "C"];
        for (var letter in letters) {
          var query = letter;
          result = "$result->$query\n";
          yield DemoRequest(query: query);
        }
      }

      var response = await stub.clientStreaming(createRequest());
      result = "$result\n<-${response.result}";
    } catch (e) {
      Log.instance.e(e);
    }
    return result;
  }

  Future<String> bidirectionalStreaming() async {
    String result = "";
    try {
      Stream<DemoRequest> createRequest() async* {
        var letters = ["x", "y", "z"];
        for (var letter in letters) {
          var query = letter;
          result = "$result->$query\n";
          yield DemoRequest(query: query);
        }
      }

      var responses = stub.bidirectionalStreaming(createRequest());
      await for (var response in responses) {
        result = "$result\n<-${response.result}";
      }
    } catch (e) {
      Log.instance.e(e);
    }
    return result;
  }
}
