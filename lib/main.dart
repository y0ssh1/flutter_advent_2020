import 'package:flutter/material.dart';
import 'package:flutter_advent_2020/components/chat_modal.dart';
import 'package:flutter_advent_2020/components/dash_divider.dart';
import 'package:flutter_advent_2020/components/gradation_icon.dart';
import 'package:flutter_advent_2020/components/loading_indicator.dart';
import 'package:flutter_advent_2020/components/rounded_button.dart';
import 'package:flutter_advent_2020/components/switchable_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アドカレ2020'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'ripple effectをcropする',
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Container(
                      height: 44,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black26)),
                      child: Center(child: Text('ダメ')),
                    ),
                  ),
                  const SizedBox(width: 12),
                  RoundedButton(
                      onTap: () {},
                      width: 100,
                      height: 44,
                      child: Text('いいかんじ'))
                ],
              ),
              const SizedBox(height: 12),
              Text('アイコンにグラデをかける'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.public, size: 30),
                  const SizedBox(width: 16),
                  GradationIcon(icon: Icons.public, size: 30)
                ],
              ),
              Text('Loadingに色をつける'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const SizedBox(width: 16),
                  LoadingIndicator(Colors.black26)
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '点線',
              ),
              DashDivider(),
              const SizedBox(height: 12),
              Text('いい感じに切り替わるDialog'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                      onTap: () => showSwitchableDialog(context),
                      width: 100,
                      height: 44,
                      child: Text('開く')),
                ],
              ),
              const SizedBox(height: 12),
              Text('チャットぽいモーダル'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                      onTap: () => showHalfModal(context),
                      width: 100,
                      height: 44,
                      child: Text('開く')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
