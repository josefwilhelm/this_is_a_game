import 'package:flutter/material.dart';

class Hud extends StatelessWidget {
  const Hud({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Player Health:'),
          LinearProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
