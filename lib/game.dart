import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:this_is_a_game/components/player/player.dart';
import 'package:this_is_a_game/hud.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    return Scaffold(
      body: Column(
        children: [
          Hud(),
          Expanded(
            child: BonfireWidget(
              map: WorldMapByTiled(
                WorldMapReader.fromAsset('simple_map.tmj'),
              ),
              playerControllers: [
                Joystick(directional: JoystickDirectional()),
                Keyboard(),
              ],
              player: HumanPlayer(
                position: Vector2(tileSize * 7, tileSize * 6),
              ),
              cameraConfig: CameraConfig(
                zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
              ),
              backgroundColor: const Color(0xff20a0b4),
            ),
          ),
        ],
      ),
    );
  }
}
