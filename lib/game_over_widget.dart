import 'package:flutter/material.dart';
import 'package:this_is_a_game/start_button.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'GAME OVER',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          StartButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              text: 'RESTART')
        ],
      ),
    );
  }
}
