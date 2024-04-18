import 'package:flutter/material.dart';

class OutputArea extends StatelessWidget {
  final String text;

  const OutputArea({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
