import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';

class Player extends SpriteComponent {
  static const Keyconfig = {
    "up": "w",
    "left": "a",
    "down": "s",
    "right": "d",
  };
  final _moveKey = [
        Keyconfig["up"],
        Keyconfig["left"],
        Keyconfig["down"],
        Keyconfig["right"],
      ],
      _moveVector = [
        Vector2(0, -1),
        Vector2(-1, 0),
        Vector2(0, 1),
        Vector2(1, 0)
      ];
  var _isKeyDown = [false, false, false, false], _moveDir = Vector2.zero();

  Player({
    required Sprite sprite,
    required Vector2 position,
    required Vector2 size,
  }) : super(sprite: sprite, position: position, size: size);
  void onKeyEvent(e) {
    for (var i = 0; i < 4; i++) {
      if (e.data.keyLabel == _moveKey[i]) _isKeyDown[i] = e is RawKeyDownEvent;
    }
  }

  @override
  void update(double dt) {
    _moveDir = Vector2.zero();
    for (var i = 0; i < 4; i++) {
      if (_isKeyDown[i]) _moveDir += _moveVector[i];
    }
    this.position += _moveDir.normalized() * 1000 * dt;
    // TODO: implement update
    super.update(dt);
  }
}
