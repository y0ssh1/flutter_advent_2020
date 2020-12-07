import 'package:flutter/cupertino.dart';
import 'package:state_notifier/state_notifier.dart';

// freezedなどで生成したほうがequalityの判定が融通が効きます
class ChatListState {
  final List<String> chats;
  const ChatListState(this.chats);
}

class ChatListStateNotifier extends StateNotifier<ChatListState> {
  final controller = ScrollController();

  ChatListStateNotifier() : super(const ChatListState([]));

  void add(String text) {
    state = ChatListState([text, ...state.chats]);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
