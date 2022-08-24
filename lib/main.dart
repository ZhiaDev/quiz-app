import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Dana'),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
