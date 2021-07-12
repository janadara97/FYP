import 'package:flutter/material.dart';
import 'package:fyp/components/Text_Field_Container.dart';
import 'package:fyp/constants.dart';

class RoundedPasswordField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final String errorMessage;
  final Function onSaved;
  final IconData suffixIcon;
  final ValueChanged onChange;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key key,
    this.controller,
    this.hintText,
    this.icon,
    this.onSaved,
    this.errorMessage,
    this.suffixIcon,
    this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFieldContainer(
        
        child: TextFormField(
          onChanged: onChange,
          obscureText: true,
          controller: controller,
          onSaved: onSaved,
          validator: (value) {
            if(value.isEmpty){
              return errorMessage;
            }
            else if (value.length<6){
              return "Your Password Need to Contain At least 7 Charatcters";
              
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(icon,color: kPrimaryColor,),
            suffixIcon: Icon(suffixIcon,color: kPrimaryColor,),
            border: InputBorder.none

          ),
        ),
      ),
    );
  }
}