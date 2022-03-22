import 'package:flutter/material.dart';

import 'constants.dart';

class IconContentWidget extends StatelessWidget {
  IconContentWidget({required this.label, required this.img});
  final label;
  final IconData img;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          img,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: kTextStyle,
        ),
      ],
    );
  }
}
