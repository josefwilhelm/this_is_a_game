import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:this_is_a_game/components/enemy/burger.dart';
import 'package:this_is_a_game/constants.dart';
import 'package:this_is_a_game/stat_controller.dart';

class GameController extends GameComponent {
  late final _statController = StatController();

  @override
  void update(double dt) {
    if (checkInterval('spawn enemies', 1500, dt)) {
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

    final burger = Burger(
        Vector2(
          x,
          y,
        ),
        burgerLife * (1 + (_statController.currentLevel - 1)));

    gameRef.add(
      burger,
    );
  }
}
