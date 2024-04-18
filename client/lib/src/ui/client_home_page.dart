import 'package:client/src/ui/output_area.dart';
import 'package:client/src/ui/sidebar.dart';
import 'package:flutter/material.dart';

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
  String responseText = "";

  void setResponseText(String text) {
    setState(() {
      responseText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            // Sidebar with buttons
            Sidebar(onPressed: setResponseText),
            // Expanded output area
            OutputArea(text: responseText),
          ],
        ),
      ),
    );
  }
}
