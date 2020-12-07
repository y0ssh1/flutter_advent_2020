import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advent_2020/states/chat_form_state.dart';
import 'package:flutter_advent_2020/states/chat_list_state.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

Future<void> showHalfModal(BuildContext context) => showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (c) => MultiProvider(
          providers: [
            StateNotifierProvider<ChatListStateNotifier, ChatListState>(
                create: (_) => ChatListStateNotifier()),
            StateNotifierProvider<ChatFormStateNotifier, String>(
                create: (_) => ChatFormStateNotifier())
          ],
          child: HalfModalContent(),
        ));

class HalfModalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
              ),
              child: Center(child: Text('ここをスワイプで閉じられる')),
            ),
            Divider(),
            SizedBox(
              height: 300,
              child: ListView(
                  reverse: true,
                  children: context
                      .select((ChatListState state) => state.chats)
                      .map((text) => Padding(
                          padding: const EdgeInsets.all(12), child: Text(text)))
                      .toList()),
            ),
            Divider(),
            _ChatForm()
          ],
        ),
      ),
    );
  }
}

class _ChatForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: context.watch<ChatFormStateNotifier>().controller,
            onChanged: context.watch<ChatFormStateNotifier>().onChange,
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                hintText: 'チャットが送れるよ'),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
            icon: Icon(Icons.send),
            onPressed: context.watch<ChatFormStateNotifier>().send)
      ]),
    );
  }
}
