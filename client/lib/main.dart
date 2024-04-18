import 'package:client/src/generated/demo_request.pb.dart';
import 'package:client/src/generated/service.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

Future<void> unary(stub) async {
  try {
    var response =
        await stub.unary(DemoRequest()..query = DateTime.now().toString());
    print(response.result);
  } catch (e) {
    print(e);
  }
}

serverStreaming(DemoServiceClient stub) async {
  try {
    var responses =
        stub.serverStreaming(DemoRequest()..query = DateTime.now().toString());
    await for (var response in responses) {
      // Process each chunk as it is received
      print(response.result);
    }
  } catch (e) {
    print(e);
  }
}

ClientChannel createChannel() {
  final channel = ClientChannel('localhost',
      port: 50051,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
  return channel;
}

Future<void> main() async {
  runApp(const Client());
}

class Client extends StatelessWidget {
  const Client({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gRPC Client Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ClientHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            // Sidebar with buttons
            Sidebar(),
            // Expanded output area
            OutputArea(),
          ],
        ),
      ),
    );
  }
}

class OutputArea extends StatelessWidget {
  const OutputArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: const Center(
          child: Text(
            "Output Area",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width * 0.2, // Set sidebar width to 20%
      color: Colors.blue[700],
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
        children: [
          ElevatedButton(
            onPressed: callUnary,
            child: const Text(
              "Unary",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ElevatedButton(
            onPressed: callServerStreaming,
            child: const Text(
              "Server streaming",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ElevatedButton(
            onPressed: callClientStreaming,
            child: const Text(
              "Client streaming",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ElevatedButton(
            onPressed: callBidirectionalStreaming,
            child: const Text(
              "Bidirectonal streaming",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> callServerStreaming() async {
    var channel = createChannel();
    await serverStreaming(DemoServiceClient(channel));
    await channel.shutdown();
  }

  void callBidirectionalStreaming() {
    // Handle button 4 press
    print("Button 4 pressed");
  }

  void callClientStreaming() {
    // Handle button 3 press
    print("Button 3 pressed");
  }

  Future<void> callUnary() async {
    var channel = createChannel();
    await unary(DemoServiceClient(channel));
    await channel.shutdown();
  }
}
