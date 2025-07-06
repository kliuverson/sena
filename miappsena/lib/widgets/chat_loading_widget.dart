import 'package:flutter/material.dart';

class ChatLoadingWidget extends StatelessWidget {
  const ChatLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 12),
          Text("Pensando...", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
