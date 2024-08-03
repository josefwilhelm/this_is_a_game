import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:this_is_a_game/constants.dart';
import 'package:this_is_a_game/game.dart';
import 'package:this_is_a_game/home.dart';
import 'package:this_is_a_game/stat_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setPortrait();
    await Flame.device.fullScreen();
  }

  runApp(const BonfireExamplesApp());
}

class BonfireExamplesApp extends StatelessWidget {
  const BonfireExamplesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StatController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Home(),
          '/game': (context) => Game(),
        },
        theme: ThemeData(
          fontFamily: 'PressStart2P',
          primaryColor: Colors.purple,
          colorScheme: const ColorScheme.dark().copyWith(
            primary: primary,
          ),
          scaffoldBackgroundColor: background,
        ),
        //home: Game(),
      ),
    );
  }
}
