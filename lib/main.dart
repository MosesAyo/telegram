import 'package:flutter/material.dart';
import 'package:telegram/home/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        highlightColor: Colors.black.withOpacity(0),
      ),
      home: Home(),
    );
  }
}
