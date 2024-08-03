import 'package:flutter/material.dart';
import 'package:this_is_a_game/start_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          StartButton(
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            },
            text: 'START',
          ),
        ],
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
