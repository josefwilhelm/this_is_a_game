import 'package:bonfire/bonfire.dart';
import 'package:flame/effects.dart';
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

  late SpriteAnimation runLeft;

  @override
  Future<void> onMount() async {
    // TODO: implement onMount
    Image imagePlayerRunLeft = await Flame.images.load('veg.png');
    SpriteAnimation runLeft = imagePlayerRunLeft.getAnimation(
      position: Vector2(0, 0),
      size: Vector2(20, 20),
      amount: 5,
      stepTime: 0.1,
      loop: true,
    );
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
    // showDamage(
    //   -life,
    //   gravity: 1,
    //   config: TextStyle(
    //     fontSize: width / 5,
    //     color: Color(0xFFFF0000),
    //   ),
    // );
    _statController.life -= life;

    add(ColorEffect(
        Color(0xFFFF0000), EffectController(duration: 0.15, alternate: true)));

    super.removeLife(life);
  }

  @override
  void onDie() {
    // TODO: implement onDie
    _statController.life = 0.0;
    _statController.updateHighScore();

    gameRef.add(
      GameDecoration.withSprite(
        sprite: Sprite.load('crypt.png'),
        position: position,
        size: Vector2.all(tileSize),
      ),
    );

    removeFromParent();
    gameRef.stopScene();

    gameRef.overlays.add('gameOver');

    super.onDie();
  }

  @override
  void onMove(
      double speed, Vector2 displacement, Direction direction, double angle) {
    radAngleRangeAttack = angle;

    super.onMove(speed, displacement, direction, angle);
  }

  @override
  Future<void> update(double dt) async {
    if (checkInterval('spawn weapon', 700, dt)) {
      simpleAttackRangeByAngle(
        attackFrom: AttackOriginEnum.PLAYER_OR_ALLY,
        marginFromOrigin: 0,
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
            amount: 1,
            stepTime: 0.2,
            textureSize: Vector2(23, 23),
          ),
        ),
        angle: radAngleRangeAttack,
        size: Vector2.all(14),
        damage: 60,
        speed: 20,
        collision: RectangleHitbox(
          size: Vector2(width / 3, width / 3),
          position: Vector2(width * 0.1, 0),
        ),
      );
    }

    super.update(dt);
  }
}
