import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:shooting_game/shootingGame.dart';

class Background extends ParallaxComponent with HasGameRef<ShootingGame> {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax([
      ParallaxImageData('background1.png'),
    ]);
  }
}
