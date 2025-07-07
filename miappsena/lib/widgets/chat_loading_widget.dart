import 'package:flutter/material.dart';

class ChatLoadingWidget extends StatefulWidget {
  const ChatLoadingWidget({super.key});

  @override
  State<ChatLoadingWidget> createState() => _ChatLoadingWidgetState();
}

class _ChatLoadingWidgetState extends State<ChatLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _controller,
            child: const Icon(
              Icons.smart_toy,
              size: 48,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Pensando...",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
