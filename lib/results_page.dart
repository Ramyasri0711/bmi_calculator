import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

//import 'input_page.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  // const ResultPage({Key? key}) : super(key: key);
  ResultPage(
      {required this.bmiResult,
      required this.bmiText,
      required this.textInteroretation});
  final bmiResult;
  final bmiText;
  final textInteroretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText,
                    style: TextStyle(
                      color: Colors.tealAccent,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: kNumStyle,
                  ),
                  Text(
                    textInteroretation,
                    style: kTextStyle,
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'Re-Calculate',
                style: TextStyle(fontSize: 20.0),
              )),
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
