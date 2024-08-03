import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:this_is_a_game/components/enemy/burger.dart';
import 'package:this_is_a_game/constants.dart';

class GameController extends GameComponent {
  int score = 0;

  @override
  void update(double dt) {
    if (checkInterval('spawn enemies', 2000, dt)) {
      if (gameRef.player != null && !gameRef.player!.isDead) {
        _addEnemyInWorld();
      }
    }
    super.update(dt);
  }

  void _addEnemyInWorld() {
    double x = tileSize * (4 + Random().nextInt(25));
    double y = Random().nextBool()
        ? tileSize * (4 + Random().nextInt(25))
        : tileSize * (5 + Random().nextInt(3));

    final goblin = Burger(Vector2(x, y));

    gameRef.add(
      goblin,
    );
  }
}
