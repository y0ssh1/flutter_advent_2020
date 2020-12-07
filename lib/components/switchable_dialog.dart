import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advent_2020/components/rounded_button.dart';

Future<void> showSwitchableDialog(BuildContext context) =>
    showDialog(context: context, builder: (_) => _ChatModal());

class _ChatModal extends StatelessWidget {
  const _ChatModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(color: Colors.transparent),
          ),
          Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            child: _ChatModalContent(),
          )
        ],
      ),
    );
  }
}

class _ChatModalContent extends StatefulWidget {
  const _ChatModalContent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatModalContentState();
}

class _ChatModalContentState extends State<_ChatModalContent> {
  int page = 0;

  void _goNext() {
    setState(() => page += 1);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: page % 2 == 0 ? _Page1(onTap: _goNext) : _Page2(onTap: _goNext));
  }
}

class _Page1 extends StatelessWidget {
  final VoidCallback onTap;

  const _Page1({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'タイトル１だよ',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 16),
        Text(
          'コンテンツ１だよ',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 12),
        RoundedButton(
            onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Dialogの前にでるsnackbarだよ'),
                behavior: SnackBarBehavior.floating)),
            width: 300,
            height: 44,
            child:
                Text('正しいsnackbar', style: Theme.of(context).textTheme.button)),
        const SizedBox(height: 12),
        RoundedButton(
            onTap: onTap,
            width: 300,
            height: 44,
            child: Text('つぎへ', style: Theme.of(context).textTheme.button)),
      ]),
    );
  }
}

class _Page2 extends StatelessWidget {
  final VoidCallback onTap;

  const _Page2({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'タイトル２だよ',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 16),
        Text(
          'コンテンツ２だよ',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 12),
        RoundedButton(
            onTap: onTap,
            width: 300,
            height: 44,
            child: Text('つぎへ', style: Theme.of(context).textTheme.button)),
      ]),
    );
  }
}
