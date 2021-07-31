import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteComponent {
  Player({
    required Sprite sprite,
    required Vector2 position,
    required Vector2 size,
  }) : super(sprite: sprite, position: position, size: size);
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }
}
