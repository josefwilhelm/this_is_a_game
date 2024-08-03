import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:this_is_a_game/constants.dart';
import 'package:this_is_a_game/stat_controller.dart';

class MyPlayer extends SimplePlayer with BlockMovementCollision {
  double radAngleRangeAttack = 0;
  late final StatController _statController;

  MyPlayer({
    required Vector2 position,
  }) : super(
          animation: SimpleDirectionAnimation(
              idleRight: SpriteAnimation.load(
                'carrot.png',
                SpriteAnimationData.sequenced(
                  amount: 4,
                  stepTime: 0.2,
                  textureSize: Vector2.all(32),
                ),
              ),
              runRight: SpriteAnimation.load(
                'carrot.png',
                SpriteAnimationData.sequenced(
                  amount: 4,
                  stepTime: 0.2,
                  textureSize: Vector2.all(32),
                ),
              )),
          position: position,
          size: Vector2.all(24),
          speed: 32,
        ) {
    receivesAttackFrom = AcceptableAttackOriginEnum.ENEMY;

    initialLife(100);
  }

  @override
  void onMount() {
    // TODO: implement onMount
    _statController = StatController();
    super.onMount();
  }

  @override
  Future<void> onLoad() {
    /// Adds rectangle collision
    ///
    ///
    add(
      RectangleHitbox(
        size: size / 2,
        position: size / 4,
      ),
    );
    return super.onLoad();
  }

  @override
  void removeLife(double life) {
    showDamage(
      life,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.white,
      ),
    );
    _statController.life -= life;

    super.removeLife(life);
  }

  @override
  void onDie() {
    // TODO: implement onDie
    _statController.life = 0.0;

    gameRef.add(
      GameDecoration.withSprite(
        sprite: Sprite.load('crypt.png'),
        position: position,
        size: Vector2.all(tileSize),
      ),
    );

    removeFromParent();
    gameRef.stopScene();

    super.onDie();
  }

  @override
  void onMove(
      double speed, Vector2 displacement, Direction direction, double angle) {
    radAngleRangeAttack = angle;

    super.onMove(speed, displacement, direction, angle);
  }

  @override
  void update(double dt) {
    if (checkInterval('spawn weapon', 500, dt)) {
      simpleAttackRangeByAngle(
        attackFrom: AttackOriginEnum.PLAYER_OR_ALLY,
        animation: SpriteAnimation.load(
          "fireball_right.png",
          SpriteAnimationData.sequenced(
            amount: 3,
            stepTime: 0.1,
            textureSize: Vector2(23, 23),
          ),
        ),
        animationDestroy: SpriteAnimation.load(
          "explosion_fire.png",
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
          ),
        ),
        angle: radAngleRangeAttack,
        size: Vector2.all(14),
        damage: 60,
        speed: 5,
        collision: RectangleHitbox(
          size: Vector2(width / 3, width / 3),
          position: Vector2(width * 0.1, 0),
        ),
      );
    }

    super.update(dt);
  }
}
