import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/components/Rounded_Button.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/components/ButtonWithoutBorder.dart';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      home: Scaffold(
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _textColor = kPrimaryColor;

  double windowHeight = 0;
  double windowWidth = 0;

  double _loginOpacity=1;
  double _headingTop =60;

  double _loginYoffset = 0; 
  double _registerYoffset=0;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width; 

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _textColor = kPrimaryColor;
        _loginYoffset = windowHeight;
        _registerYoffset=windowHeight;
        _loginOpacity=1;
        _headingTop=60;
        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _textColor = Colors.white;
        _loginYoffset = 200;
        _registerYoffset=windowHeight;
        _loginOpacity=1;
        _headingTop=40;
        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _textColor = Colors.white;
        _loginYoffset = 180;
        _registerYoffset=220;
        _loginOpacity=0.7;
        _headingTop=40;
        break;
    }
    return SafeArea(
      child: Stack(children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                                      _pageState=0;
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
         GestureDetector(
           onTap: (){
             setState(() {
                            _pageState=2;
                          });
           },
           child: AnimatedContainer(
             width: double.infinity,
             child: Column(
               children: [
                 RoundedButton(
                   text: "Login",
                   press: (){},

                 ),
               
                 ButtonWithoutBorder(
                   text: "Create New Account",
                   press: (){},
                 ),
               ],
             ),
             duration: Duration(milliseconds: 1000),
             curve: Curves.fastLinearToSlowEaseIn,
            transform: Matrix4.translationValues(0, _loginYoffset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_loginOpacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        ),
         ), 
         //container for Registration Page
         GestureDetector(
           onTap: (){
             setState(() {
                            _pageState=1;
                          });
           },
           child: AnimatedContainer(
             duration: Duration(milliseconds: 1000),
             curve: Curves.fastLinearToSlowEaseIn,
            transform: Matrix4.translationValues(0, _registerYoffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        ),
         ),
      ]),
    );
  }
}
