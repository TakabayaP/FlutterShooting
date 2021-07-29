import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:shooting_game/shootingGame.dart';

class Shooting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: ShootingGame(onEnd: () {
        Navigator.pop(context);
      }),
    );
    //GameWidget として渡すことで game を widget として扱える
  }
}
