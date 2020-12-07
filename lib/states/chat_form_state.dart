import 'package:flutter/cupertino.dart';
import 'package:flutter_advent_2020/states/chat_list_state.dart';
import 'package:state_notifier/state_notifier.dart';

class ChatFormStateNotifier extends StateNotifier<String> with LocatorMixin {
  final controller = TextEditingController();
  ChatListStateNotifier get _listStateNotifier => read();

  ChatFormStateNotifier() : super('');

  void onChange(String text) {
    state = text;
  }

  void send() {
    _listStateNotifier.add(state);
    controller.clear();
    state = '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
