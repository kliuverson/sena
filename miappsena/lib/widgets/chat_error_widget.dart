import 'package:flutter/material.dart';

class ChatErrorWidget extends StatelessWidget {
  final String error;

  const ChatErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "⚠️ Error: $error",
        style: const TextStyle(color: Colors.red, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
