import 'package:bonfire/bonfire.dart';
import 'package:this_is_a_game/components/player/person_sprite_sheet.dart';

class HumanPlayer extends SimplePlayer with BlockMovementCollision {
  HumanPlayer({
    required Vector2 position,
  }) : super(
          animation: PersonSpritesheet().simpleAnimation(),
          position: position,
          size: Vector2.all(24),
          speed: 32,
        );

  @override
  Future<void> onLoad() {
    /// Adds rectangle collision
    add(
      RectangleHitbox(
        size: size / 2,
        position: size / 4,
      ),
    );
    return super.onLoad();
  }
}
