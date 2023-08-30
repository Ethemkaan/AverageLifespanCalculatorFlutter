import 'package:flutter/material.dart';
import 'package:life/constant.dart';
class GenderColumn extends StatelessWidget {
  final String cinsiyet ;
  final IconData iconData;
  GenderColumn({required this.cinsiyet,required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(cinsiyet , style: kTextStyle,)
      ],
    );
  }
}
