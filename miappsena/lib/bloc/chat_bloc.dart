import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../services/openai_service.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final OpenAIService openAIService;

  ChatBloc({required this.openAIService}) : super(const ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatLoading());
    try {
      final response = await openAIService.sendMessage(event.prompt);
      emit(ChatSuccess(response));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}

