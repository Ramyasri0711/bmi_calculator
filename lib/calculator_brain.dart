import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(this.wei, this.hei);
  final int hei;
  final int wei;

  double? bmi;
  String calculateBMI() {
    bmi = (wei / pow(hei, 2));
    return bmi!.toStringAsFixed(1);
  }

  String getResult() {
    // double bmi;
    if (bmi! > 18.5) {
      return 'Normal';
    } else if (bmi! >= 25) {
      return 'Overweight';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    // double bmi;
    if (bmi! > 18.5) {
      return 'You have a Normal Body Weight.';
    } else if (bmi! >= 25) {
      return 'you have higher than the normal body weight.';
    } else {
      return 'you have lower than the normal body weight';
    }
  }
}
