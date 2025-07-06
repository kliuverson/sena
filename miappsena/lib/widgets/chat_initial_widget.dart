import 'package:flutter/material.dart';

class ChatInitialWidget extends StatelessWidget {
  const ChatInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Escribe un mensaje para comenzar.",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
