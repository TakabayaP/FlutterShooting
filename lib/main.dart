import 'package:flutter/material.dart';
import 'package:shooting_game/shooting.dart';

void main() => runApp(MaterialApp(
      home: MainPage(),
    ));

class MainPage extends StatelessWidget {
  final shooting = Shooting();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => shooting),
        );
      },
      child: Text("Start"),
    ));
  }
}
