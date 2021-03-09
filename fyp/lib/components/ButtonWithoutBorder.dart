import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class ButtonWithoutBorder extends StatelessWidget {
  final String text;
  final Function press;
  final Color textColor, bColor;

  const ButtonWithoutBorder(
      {Key key,
      this.text,
      this.press,
      this.bColor =Colors.white,
      this.textColor = kPrimaryColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: kPrimaryColor)
      ),
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          
          style: TextButton.styleFrom(

              backgroundColor: bColor,
              primary: textColor,
              
              padding: EdgeInsets.symmetric(vertical: 20)),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15
            ),
          ),
          onPressed: press,
        ),
      ),
    );
  }
}
