import 'dart:math'; // Import the dart:math library

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
  double _experience = 0;
  double _currentLevel = 1;

  double get life => _life;
  double get score => _score;
  double get experience => _experience;
  double get currentLevel => _currentLevel;

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

  int experienceForNextLevel() {
    return (baseExperience * pow(1.40, _currentLevel - 1))
        .toInt(); // Use the pow function from the dart:math library
  }

  void addExperience(double experience) {
    _experience += experience;
    while (_experience >= experienceForNextLevel()) {
      _experience -= experienceForNextLevel();
      _currentLevel++;
      notifyListeners();
    }
  }

  reset() {
    _life = _maxLife;
    _score = 0;
    _experience = 0;
    _currentLevel = 1;
    notifyListeners();
  }
}
