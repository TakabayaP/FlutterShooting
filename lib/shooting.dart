import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:shooting_game/shootingGame.dart';

class Shooting extends StatelessWidget {
  const Shooting({Key? key}) : super(key: key);
  //なにこれ おまじない？

  @override
  Widget build(BuildContext context) {
    ShootingGame game = ShootingGame(onEnd: () {
      Navigator.pop(context);
    });
    //constructor
    void onEventKey(RawKeyEvent event) {
      game.onKeyEvent(event);
    }

    //shootingGame 内の onKeyEvent をキーイベント時に呼び出す
    return RawKeyboardListener(
        //リスナーでくるんでキーイベントを発火
        focusNode: FocusNode(),
        onKey: onEventKey,
        autofocus: true, //普通にくるむだけだとここがうまく行かない？
        child: GameWidget(
          game: game,
        ));
    //GameWidget として渡すことで game を widget として扱える
  }
}
