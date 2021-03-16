import 'package:flutter/material.dart';
import 'package:fyp/components/Text_Field_Container.dart';
import 'package:fyp/constants.dart';

class RoundedPasswordField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final IconData suffixIcon;
  final ValueChanged<String> onChange;

  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.icon,
    this.suffixIcon,
    this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon,color: kPrimaryColor,),
          suffixIcon: Icon(suffixIcon,color: kPrimaryColor,),
          border: InputBorder.none

        ),
      ),
    );
  }
}