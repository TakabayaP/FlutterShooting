import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/keyboard.dart';
import 'package:flutter/services.dart';
import 'package:shooting_game/components/background.dart';
import 'package:shooting_game/components/enemy.dart';
import 'package:shooting_game/components/player.dart';

class ShootingGame extends BaseGame with KeyboardEvents, HasCollidables {
  final VoidCallback onEnd;
  final Vector2 viewportResolution;
  ShootingGame({required this.onEnd, required this.viewportResolution});
  @override
  void onAttach() {
    super.onAttach();
  }

  late final _player;
  @override
  Future<void> onLoad() async {
    viewport = FixedResolutionViewport(viewportResolution);
    //viewport に FixedResolutionViewportを代入すれば値が固定される
    //camera 周りがよくわからん とりあえず無視
    await images.loadAll(["player2.png", "bullet1.png"]);
    add(Background("background1.png"));
    //背景を追加
    _player = Player(
        sprite: Sprite(images.fromCache("player2.png")),
        size: Vector2(100, 100),
        position: Vector2(100, 300));
    add(_player);
    add(Enemy(
        sprite: Sprite(images.fromCache("player2.png")),
        position: Vector2(100, 100)));
    //プレイヤーを追加 もう少しきれいな実装考えたい
  }

  void onKeyEvent(e) {
    final bool isKeyDown = e is RawKeyDownEvent;
    //print(" Key:${e.logicalKey}- isKeyDown: $isKeyDown");
    if (e.data.keyLabel == "q") onEnd();
    _player.onKeyEvent(e);
  }

  @override
  void render(Canvas canvas) {
    print(fps(120));
    // TODO: implement render
    super.render(canvas);
  }
  //コールバックすることで子から親の関数を呼び出すことができる
  //BaseGame を Stateless Widget でラップすることで Navigator を使用可能に
}
