import 'dart:math'; // Import the dart:math library

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:this_is_a_game/constants.dart';

class StatController extends ChangeNotifier {
  static final StatController _singleton = StatController._internal();

  factory StatController() {
    return _singleton;
  }

  StatController._internal() {
    getHighScoreFromSharedPreferences();
  }

  double _maxLife = playerLife;
  get maxLife => _maxLife;

  double _life = playerLife;
  int _score = 0;
  double _experience = 0;
  double _currentLevel = 1;
  int _highscore = 0;

  double get life => _life;
  int get score => _score;
  double get experience => _experience;
  double get currentLevel => _currentLevel;

  int get highScore => _highscore;

  set life(double newLife) {
    _life = newLife;
    notifyListeners();
  }

  set score(int newscore) {
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

  void getHighScoreFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int hs = prefs.getInt('highScore') ?? 0;
    _highscore = hs;
    notifyListeners();
  }

  Future<void> saveHighScoreToSharedPreferences(int highScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highScore', highScore);
    return;
  }

  void updateHighScore() {
    if (_score > _highscore) {
      _highscore = _score;
      saveHighScoreToSharedPreferences(_score);
      notifyListeners();
    }
  }

  void resetHighScore() {
    _score = 0;
    saveHighScoreToSharedPreferences(_score);
    notifyListeners();
  }
}
