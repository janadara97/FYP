import 'package:flutter/material.dart';
import 'package:fyp/components/Text_Field_Container.dart';
import 'package:fyp/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String errorMessage;
  final IconData icon;
  final Function onSaved;
  final ValueChanged onChange;
  final TextEditingController controller;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.controller,
    this.errorMessage,
    this.onSaved,
    this.icon,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Form(
        
        child: TextFormField(
          controller: controller,
          
          onSaved:onSaved,
          validator: (input) {
            if (input.isEmpty) {
              return errorMessage;
            }
            return null;
          },
          onChanged: onChange,
          decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(icon, color: kPrimaryColor),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
