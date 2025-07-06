import 'package:flutter/material.dart';

class ChatSuccessWidget extends StatelessWidget {
  final String response;

  const ChatSuccessWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(12),
        child: Text(
          response,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
