import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

//import 'login.dart';

void main() {
  runApp(BMI_Calculator());
}

class BMI_Calculator extends StatelessWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Input_page(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}
