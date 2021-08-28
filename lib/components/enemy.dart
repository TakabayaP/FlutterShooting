import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';

class Enemy extends SpriteComponent with HasGameRef, Hitbox, Collidable {
  Enemy({required Sprite sprite, required Vector2 position})
      : super(sprite: sprite, position: position, size: Vector2(100, 100)) {
    //addHitBox(HitboxCircle());
    addShape(HitboxRectangle());
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }
}
