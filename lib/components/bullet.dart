import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Bullet extends SpriteComponent {
  Bullet({required Sprite sprite, required Vector2 position})
      : super(sprite: sprite, position: position, size: Vector2(30, 30));

  @override
  void update(double dt) {
    this.position += Vector2(0, -1) * 1000 * dt;
    super.update(dt);
  }
}
