import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';
import 'package:shooting_game/components/bullet.dart';
import 'package:shooting_game/shootingGame.dart';

class Player extends SpriteComponent with HasGameRef<ShootingGame> {
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
  final _playerSpeed = 700.0;
  var _isKeyDown = [false, false, false, false, false],
      _moveDir = Vector2.zero();
  late final _bulletSprite;
  double _shootInterval = 100;
  Player({
    required Sprite sprite,
    required Vector2 position,
    required Vector2 size,
  }) : super(sprite: sprite, position: position, size: size);
  void onKeyEvent(e) {
    for (var i = 0; i < 4; i++) {
      if (e.data.keyLabel == _moveKey[i]) _isKeyDown[i] = e is RawKeyDownEvent;
    }
    if (e.logicalKey == LogicalKeyboardKey.space)
      _isKeyDown[4] = e is RawKeyDownEvent;
  }

  @override
  Future<void>? onLoad() async {
    _bulletSprite = Sprite(gameRef.images.fromCache("bullet1.png"));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _moveDir = Vector2.zero();
    for (var i = 0; i < 4; i++) {
      if (_isKeyDown[i]) _moveDir += _moveVector[i];
    }
    if (_isKeyDown[4] && _shootInterval > 0.25) {
      gameRef
          .add(Bullet(position: this.position.clone(), sprite: _bulletSprite));
      _shootInterval = 0;
    }
    _shootInterval += dt;
    this.position += _moveDir.normalized() * _playerSpeed * dt;
    // TODO: implement update
    super.update(dt);
  }
}
