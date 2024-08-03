import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:this_is_a_game/constants.dart';
import 'package:this_is_a_game/game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  runApp(const BonfireExamplesApp());
}

class BonfireExamplesApp extends StatelessWidget {
  const BonfireExamplesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: primary,
        ),
        scaffoldBackgroundColor: background,
      ),
      home: Game(),
    );
  }
}
