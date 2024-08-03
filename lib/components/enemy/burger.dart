import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:this_is_a_game/constants.dart';
import 'package:this_is_a_game/stat_controller.dart';

class Burger extends SimpleEnemy
    with BlockMovementCollision, PlayerControllerListener {
  double attack = 10;
  bool enableBehaviors = true;
  final double experience = 20;

  late StatController _statController;

  Burger(Vector2 position, [double life = burgerLife])
      : super(
          animation: SimpleDirectionAnimation(
              idleRight: SpriteAnimation.load(
                'burger_spritesheet.png',
                SpriteAnimationData.sequenced(
                  amount: 1,
                  stepTime: 0.2,
                  textureSize: Vector2.all(32),
                ),
              ),
              runRight: SpriteAnimation.load(
                'burger_spritesheet.png',
                SpriteAnimationData.sequenced(
                  amount: 1,
                  stepTime: 0.2,
                  textureSize: Vector2.all(32),
                ),
              )),
          // animation: PersonSpritesheet(path: 'burger_spritesheet.png')
          //     .simpleAnimation(),
          position: position,
          size: Vector2.all(tileSize * 1.5),
          speed: burgerSpeed,
          life: life,
        ) {}

  @override
  void onMount() {
    // TODO: implement onMount
    _statController = StatController();
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // if (!enableBehaviors) return;

    // if (!gameRef.sceneBuilderStatus.isRunning) {
    seeAndMoveToPlayer(
      runOnlyVisibleInScreen: false,
      radiusVision: 10000,
      closePlayer: (p) {
        execAttack(attack);
      },
    );
  }

  void execAttack(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackMelee(
      size: Vector2.all(width),
      damage: damage + (pow(1.30, _statController.currentLevel - 1)),
      interval: 400,
      sizePush: 2,
      // animationRight: CommonSpriteSheet.blackAttackEffectRight,
    );
  }

  @override
  void onDie() {
    super.onDie();

    _statController.score += 1;
    _statController.addExperience(experience);

    removeFromParent();
  }

  @override
  void removeLife(double life) {
    final effect = SequenceEffect([
      ColorEffect(Colors.red, EffectController(duration: 0.1, alternate: true)),
    ]);

    add(effect);

    showDamage(
      life,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.white,
      ),
    );
    super.removeLife(life);
  }

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size / 2, position: size / 4));

    return super.onLoad();
  }
}
