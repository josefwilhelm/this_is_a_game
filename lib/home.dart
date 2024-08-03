import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:this_is_a_game/start_button.dart';
import 'package:this_is_a_game/stat_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<StatController>();

    return Scaffold(
      body: Stack(children: [
        // Background Image
        Opacity(
          opacity: 0.4,
          child: Image.asset(
            'assets/images/Pixel-Art-Carrot.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        // Foreground Content
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'This is a Game',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PressStart2P'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                StartButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  text: 'START',
                ),
                const SizedBox(height: 20),
                Text(
                  'HIGHSCORE: ${stats.highScore}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}
