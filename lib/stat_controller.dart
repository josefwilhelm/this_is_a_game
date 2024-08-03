import 'package:flutter/material.dart';
import 'package:this_is_a_game/constants.dart';

class StatController extends ChangeNotifier {
  static final StatController _singleton = StatController._internal();

  factory StatController() {
    return _singleton;
  }

  StatController._internal();

  double _maxLife = playerLife;
  get maxLife => _maxLife;

  double _life = playerLife;
  double _score = 0;

  double get life => _life;
  double get score => _score;

  set life(double newLife) {
    _life = newLife;
    notifyListeners();
  }

  set score(double newscore) {
    _score = newscore;
    notifyListeners();
  }

  void configure({required double maxLife, required double maxStamina}) {
    _life = _maxLife = maxLife;
    notifyListeners();
  }

  void updateLife(double life) {
    if (this.life != life) {
      this.life = life;
    }
  }
}
