import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:shooting_game/components/enemy.dart';

class Bullet extends SpriteComponent with Hitbox, Collidable {
  Bullet({required Sprite sprite, required Vector2 position})
      : super(sprite: sprite, position: position, size: Vector2(30, 30));

  @override
  void onMount() {
    addShape(HitboxCircle());
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is Enemy) {
      this.remove();
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    this.position += Vector2(0, -1) * 1000 * dt;
    super.update(dt);
  }
}
