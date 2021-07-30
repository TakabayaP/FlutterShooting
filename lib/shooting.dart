import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:shooting_game/shootingGame.dart';

class Shooting extends StatelessWidget {
  const Shooting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShootingGame game = ShootingGame(onEnd: () {
      Navigator.pop(context);
    });
    void onEventKey(RawKeyEvent event) {
      game.onKeyEvent(event);
    }

    return RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: onEventKey,
        autofocus: true,
        child: GameWidget(
          game: ShootingGame(onEnd: () {
            Navigator.pop(context);
          }),
        ));
    //GameWidget として渡すことで game を widget として扱える
  }
}
