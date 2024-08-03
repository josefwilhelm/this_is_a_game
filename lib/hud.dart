import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:this_is_a_game/stat_controller.dart';
import 'package:pixelarticons/pixelarticons.dart';

class Hud extends StatelessWidget {
  const Hud({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatController>();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Player Name', //placeholder name
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: LinearProgressIndicator(
                        value: stats.life / stats.maxLife,

                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        backgroundColor: Color.fromARGB(120, 244, 67, 54),
                        minHeight: 24, //
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: Icon(Pixel.heart, color: Colors.white, fill: 1.0),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: LinearProgressIndicator(
                        value:
                            stats.experience / stats.experienceForNextLevel(),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        backgroundColor: Color.fromARGB(120, 76, 175, 79),
                        minHeight: 24, //
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: Icon(
                        Icons.flash_on,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Level: ${stats.currentLevel}',
              textAlign: TextAlign.right,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Score: ${stats.score}',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
