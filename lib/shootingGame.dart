import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';
import 'package:flame/keyboard.dart';
import 'package:flame/parallax.dart';
import 'package:flame/components.dart';
import 'package:shooting_game/components/background.dart';

class ShootingGame extends BaseGame with KeyboardEvents {
  final VoidCallback onEnd;
  ShootingGame({
    required this.onEnd,
  });
  @override
  void onAttach() {
    //onEnd();
    //add(Background());
  }

  var image, player, parallaxComponent;
  @override
  Future<void> onLoad() async {
    final _bg = await loadParallaxComponent(
      [ParallaxImageData('background1.png')],
    );
    add(_bg);
  }

  @override
  void onKeyEvent(e) {
    final bool isKeyDown = e is RawKeyDownEvent;
    print(" Key: ${e.data.keyLabel} - isKeyDown: $isKeyDown");
    if (e.data.keyLabel == "q") onEnd();
  }

  //コールバックすることで子から親の関数を呼び出すことができる
  //BaseGame を Stateless Widget でラップすることで Navigator を使用可能に
}
