import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class ShootingGame extends BaseGame {
  final VoidCallback onEnd;
  ShootingGame({
    required this.onEnd,
  });
  @override
  void onAttach() {
    onEnd();
  }

  //コールバックすることで子から親の関数を呼び出すことができる
  //BaseGame を Stateless Widget でラップすることで Navigator を使用可能に
  @override
  void render(Canvas canvas) {}
  @override
  void update(double dt) {}
}
