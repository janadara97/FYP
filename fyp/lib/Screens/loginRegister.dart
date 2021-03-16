import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/components/ButtonWithoutBorder.dart';
import 'package:fyp/components/Rounded_Button.dart';
import 'package:fyp/components/Rounded_Input_Filed.dart';
import 'package:fyp/components/Rounded_password_field.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../constants.dart';

class LoginReg extends StatefulWidget {
  @override
  _LoginRegState createState() => _LoginRegState();
}

class _LoginRegState extends State<LoginReg> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _textColor = kPrimaryColor;

  double windowHeight = 0;
  double windowWidth = 0;

  double _loginOpacity = 1;
  double _headingTop = 60;

  double _loginYoffset = 0;
  double _registerYoffset = 0;
  bool _keyboardVisibility=false;
  double _loginKeyboardMargin=0;
  double _loginHeight=0;
  double _registerKeyboardMargin=0;
  double _registerHeight=0;

     void initState() {
      super.initState();

      KeyboardVisibilityNotification().addNewListener(
        onChange: (bool visible) {
          setState(() {
                      _keyboardVisibility=visible;
                      
                    });
        },
      );
    }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    _loginHeight = windowHeight - 150;
    _registerHeight=windowHeight - 150;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _textColor = kPrimaryColor;
        _loginYoffset = windowHeight;
        _registerYoffset = windowHeight;
        _loginOpacity = 1;
        _headingTop = 60;
        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _textColor = Colors.white;
        _loginYoffset = _keyboardVisibility ? 10 : 150;
        _registerYoffset = windowHeight;
        _loginOpacity = 1;
        _headingTop = 40;
        _loginKeyboardMargin = 50;
        _loginHeight = _keyboardVisibility ? windowHeight : _loginHeight;

        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _textColor = Colors.white;
        _loginYoffset = windowHeight;
        _registerYoffset = _keyboardVisibility ? 10 : 150;
        _registerKeyboardMargin = 50;
        _loginOpacity = 0.7;
        _headingTop = 40;
        _registerHeight = _keyboardVisibility ? windowHeight : _registerHeight;

        break;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: SafeArea(
          child: Stack(children: [
            AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              color: _backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(top: _headingTop),
                      child: Column(
                        children: [
                          Text(
                            "Learn Free",
                            style: TextStyle(
                              color: _textColor,
                              fontSize: 28,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "learn free thing learn free thing learn free thing learn free tearn free thing ",
                              style: TextStyle(
                                color: _textColor,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: SvgPicture.asset("assets/icons/login.svg")),
                  ),
                  Container(
                    child: RoundedButton(
                      press: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        });
                      },
                      text: "Get Started",
                    ),
                  ),
                ],
              ),
            ),

            //Container for login page

            AnimatedContainer(
              height: _loginHeight,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          "Log In to Continue",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      RoundedInputField(
                        hintText: "E-mail",
                        icon: Icons.email,
                        onChange: (value) {},
                      ),
                      RoundedPasswordField(
                        hintText: "E-mail",
                        icon: Icons.lock,
                        suffixIcon: Icons.visibility,
                        onChange: (value) {},
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(bottom: _loginKeyboardMargin),
                    child: Column(
                      children: [
                        RoundedButton(
                          text: "Login",
                          press: () {},
                        ),
                        ButtonWithoutBorder(
                          text: "Create New Account",
                          press: () {
                            setState(() {
                              _pageState = 2;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              transform: Matrix4.translationValues(0, _loginYoffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(_loginOpacity),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            ),

            //register

            AnimatedContainer(
              height: _registerHeight,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          "SignUP",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      RoundedInputField(
                        hintText: "E-mail",
                        icon: Icons.email,
                        onChange: (value) {},
                      ),
                      RoundedPasswordField(
                        hintText: "E-mail",
                        icon: Icons.lock,
                        suffixIcon: Icons.visibility,
                        onChange: (value) {},
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(bottom: _registerKeyboardMargin),
                    child: Column(
                      children: [
                        RoundedButton(
                          text: "SignUp",
                          press: () {},
                        ),
                        ButtonWithoutBorder(
                          text: "Already Have an Account?",
                          press: () {
                            setState(() {
                              _pageState = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              transform: Matrix4.translationValues(0, _registerYoffset, 1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
            )
          ]),
        ),
      ),
    );
  }
}
