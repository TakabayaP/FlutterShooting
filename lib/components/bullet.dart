import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';

class Bullet extends SpriteComponent {
  late final _image;
  Bullet({required Sprite sprite, required Vector2 position})
      : super(sprite: sprite, position: position, size: Vector2(30, 30));

  @override
  void update(double dt) {
    this.position += Vector2(0, -1) * 1000 * dt;
    // TODO: implement update
    super.update(dt);
  }
}