
import 'package:flutter/material.dart';

import 'excesise.dart';

class ExerciseProvider extends ChangeNotifier {
  List<Exercise> _exercises = [];

  List<Exercise> get exercises => _exercises;

  void addExercise(Exercise exercise) {
    _exercises.add(exercise);
    notifyListeners();
  }
}
