import 'package:flutter/material.dart';
import 'package:fyp/components/Text_Field_Container.dart';
import 'package:fyp/constants.dart';

class RoundedInputField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final ValueChanged onChange;
const RoundedInputField({
  Key key,
  this.hintText,
  this.icon,
  this.onChange,

}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
       child:TextField(
         onChanged: onChange,
         decoration: InputDecoration(
           hintText: hintText,
           icon: Icon(icon,color: kPrimaryColor),
           border: InputBorder.none
         ),
       ),
    );
  }
}