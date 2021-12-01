import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

class IconColumn extends StatelessWidget {
  IconColumn({@required this.icon,@required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: ktextvariable
        ),
      ],
    );
  }
}