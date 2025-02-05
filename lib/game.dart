import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:this_is_a_game/components/player/player.dart';
import 'package:this_is_a_game/constants.dart';
import 'package:this_is_a_game/game_controller.dart';
import 'package:this_is_a_game/game_over_widget.dart';
import 'package:this_is_a_game/hud.dart';
import 'package:this_is_a_game/stat_controller.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StatController(),
      child: Scaffold(
        body: Column(
          children: [
            Hud(),
            Expanded(
              child: BonfireWidget(
                map: WorldMapByTiled(
                  WorldMapReader.fromAsset('simple_map.tmj'),
                ),
                playerControllers: [
                  Joystick(
                      directional: JoystickDirectional(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(bottom: 50, right: 30))),
                  Keyboard(),
                ],
                components: [GameController()],
                player: MyPlayer(
                  position: Vector2(tileSize * 13, tileSize * 10),
                ),
                cameraConfig: CameraConfig(
                  zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
                ),
                backgroundColor: Color.fromARGB(255, 49, 49, 49),
                overlayBuilderMap: {
                  'gameOver': (_, game) {
                    return GameOverWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
