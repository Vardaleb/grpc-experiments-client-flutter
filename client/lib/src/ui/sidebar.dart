import 'package:client/src/demo_service.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final void Function(String text) onPressed;

  const Sidebar({super.key, required this.onPressed});

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
            onPressed: () async {
              onPressed(await DemoService.instance.unary());
            },
            child: const Text(
              "Unary",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              onPressed(await DemoService.instance.serverStreaming());
            },
            child: const Text(
              "Server streaming",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              onPressed(await DemoService.instance.clientStreaming());
            },
            child: const Text(
              "Client streaming",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              onPressed(await DemoService.instance.bidirectionalStreaming());
            },
            child: const Text(
              "Bidirectonal streaming",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
