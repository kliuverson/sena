import 'package:flutter/material.dart';

class ChatInitialWidget extends StatelessWidget {
  const ChatInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.memory,           // ícono de chip (IA)
            size: 72,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 16),
          Text(
            "Escribe un mensaje para comenzar.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
