import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/chat_bloc.dart';
import 'bloc/chat_event.dart';
import 'bloc/chat_state.dart';
import 'services/openai_service.dart';


import 'widgets/chat_initial_widget.dart';
import 'widgets/chat_loading_widget.dart';
import 'widgets/chat_success_widget.dart';
import 'widgets/chat_error_widget.dart';

void main() {
  runApp(const ChatGPTBlocApp());
}

class ChatGPTBlocApp extends StatelessWidget {
  const ChatGPTBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT con BLoC',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ChatBloc(openAIService: OpenAIService()),
        child: const ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) return;

    context.read<ChatBloc>().add(SendMessageEvent(prompt));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChatGPT + BLoC")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Escribe tu mensaje...",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoading) {
                    return const ChatLoadingWidget();
                  } else if (state is ChatSuccess) {
                    return ChatSuccessWidget(response: state.response);
                  } else if (state is ChatError) {
                    return ChatErrorWidget(error: state.error);
                  } else {
                    return const ChatInitialWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

