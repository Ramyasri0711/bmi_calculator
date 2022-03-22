//import 'package:flutter/cupertino.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator_brain.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

class Input_page extends StatefulWidget {
  const Input_page({Key? key}) : super(key: key);

  @override
  State<Input_page> createState() => _Input_pageState();
}

enum Gender { male, female }

class _Input_pageState extends State<Input_page> {
  Gender? selectedCardColor;
  int height = 180;
  int weight = 45;
  int age = 16;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  // void changeColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = cardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = cardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }
  // CalculatorBrain? calc;
  @override
  // void initState() {
  //   super.initState();
  //   calc = CalculatorBrain(wei: weight, hei: height);
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedCardColor = Gender.male;
                    });
                  },
                  colour: selectedCardColor == Gender.male
                      ? kCardColor
                      : kInactiveCardColor,
                  cardChild: IconContentWidget(
                    label: 'MALE',
                    img: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCardColor = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedCardColor = Gender.female;
                      });
                    },
                    colour: selectedCardColor == Gender.female
                        ? kCardColor
                        : kInactiveCardColor,
                    cardChild: IconContentWidget(
                      img: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFFFFFFF),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x26EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 24.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 240.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {},
                  colour: kCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kTextStyle),
                      Text(
                        weight.toString(),
                        style: kNumStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {},
                  colour: kCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: kTextStyle),
                      Text(
                        age.toString(),
                        style: kNumStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            child: Container(
              child: Center(
                  child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: 20.0),
              )),
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
            ),
            onTap: () {
              //initState();
              CalculatorBrain? calc = CalculatorBrain(weight, height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            bmiText: calc.getResult(),
                            textInteroretation: calc.getInterpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
