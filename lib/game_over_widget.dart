import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:this_is_a_game/start_button.dart';
import 'package:this_is_a_game/stat_controller.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatController>();
    return Container(
      color: Colors.black.withOpacity(0.5),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (stats.score == stats.highScore) ...{
            Text(
              'NEW HIGHSCORE!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          },
          const SizedBox(height: 12),
          const Text(
            'GAME OVER',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          StartButton(
              onPressed: () {
                stats.reset();
                Navigator.pushNamed(context, '/game');
              },
              text: 'RESTART')
        ],
      ),
    );
  }
}
