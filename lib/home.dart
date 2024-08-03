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
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Home(),
      ),
    ),
  ));
}
