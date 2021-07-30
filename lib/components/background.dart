import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';
import 'package:shooting_game/shootingGame.dart';

class Background extends ParallaxComponent with HasGameRef<ShootingGame> {
  String pictureName;
  Background(this.pictureName);
  //contructor でプロパティの設定ができる
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax([
      ParallaxImageData(pictureName),
    ],
        repeat: ImageRepeat.repeatY,
        baseVelocity: Vector2(0, 500),
        fill: LayerFill.width);
  }
  //多分あとでもっと高度な背景クラスを作る(複数枚の背景を重ねて異なる速さで動かすとか)
}
