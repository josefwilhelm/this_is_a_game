import 'package:flutter/material.dart';

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
              // TODO
              Navigator.pushNamed(context, '/game');
            },
          ),
        ],
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Button background color
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: const Text(
          'START',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'PressStart2P',
            color: Colors.white,
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
