import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fyp/components/ButtonWithoutBorder.dart';
import 'package:fyp/components/Rounded_Button.dart';
import 'package:fyp/components/Rounded_Input_Filed.dart';
import 'package:fyp/components/Rounded_password_field.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';


import '../constants.dart';
import 'TODO/mainTODO.dart';

class LoginReg extends StatefulWidget {
  @override
  _LoginRegState createState() => _LoginRegState();
}

class _LoginRegState extends State<LoginReg> {
final TextEditingController _signInEmailController = TextEditingController();
final TextEditingController _signInPasswordController = TextEditingController();
final TextEditingController _signupEmailController = TextEditingController();
final TextEditingController _signUpPasswordController = TextEditingController();


  String _email;
  String _password;

  String _rEmail;
  String _rPassword;


  final auth =FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _textColor = kPrimaryColor;

  double windowHeight = 0;
  double windowWidth = 0;

  double _loginOpacity = 1;
  double _headingTop = 60;

  double _loginYoffset = 0;
  double _registerYoffset = 0;
  bool _keyboardVisibility = false;
  double _loginKeyboardMargin = 0;
  double _loginHeight = 0;
  double _registerKeyboardMargin = 0;
  double _registerHeight = 0;

  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisibility = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    _loginHeight = windowHeight;
    _registerHeight = windowHeight;

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
        _loginYoffset = _keyboardVisibility ? 30 : 30;
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
        _registerYoffset = _keyboardVisibility ? 30 : 30;
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
                            "PTFM",
                            style: TextStyle(
                              color: _textColor,
                              fontSize: 28,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Manage Your Task Workflow with Easy Hands ",
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "Log In to Continue",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        RoundedInputField(
                          controller: _signInEmailController,
                          errorMessage: "Please Enter an Email",
                          hintText: "User Name",
                          icon: Icons.email,
                         onChange: (input){
                            _email = input;
                          },
                          onSaved: (input) => _email = input,
                        ),
                        RoundedPasswordField(
                          controller: _signInPasswordController,
                          errorMessage: "Please Eneter a Password",
                          hintText: "Password",
                          icon: Icons.lock,
                          onChange: (input){
                            _password = input;
                          },
                          onSaved: (input) => _password = input,
                          suffixIcon: Icons.visibility,
                          // onChange: (value) {
                          //   setState(() {
                          //   _password=value.trim();                          
                          //                             });
                          // },
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(bottom: _loginKeyboardMargin),
                    child: Column(
                      children: [
                        RoundedButton(
                          text: "Login",
                           press:Login

                          
                        ),
                        ButtonWithoutBorder(
                          text: "Create New Account",
                          press: () {
                            //+Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage()));

                             setState(() {
                               _pageState = 2;
                            }
                            )
                            ;
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
                        hintText: "User Name",
                       // controller: _signupEmailController,
                        icon: Icons.email,
                        onChange: (value) {},
                      ),
                      RoundedInputField(
                        hintText: "Email",
                        onChange: (input){
                          _rEmail = input;
                        },
                        controller: _signupEmailController,
                        icon: Icons.email,
                        onSaved: (input) => _rEmail = input,

                      ),
                      RoundedPasswordField(
                        controller: _signUpPasswordController,
                        hintText: "Password",
                        icon: Icons.lock,
                        onSaved: (input) => _rPassword = input,
                        suffixIcon: Icons.visibility,
                        onChange: (input){
                          _rPassword = input;
                        },
                      ),
                      RoundedPasswordField(
                        hintText: "Confirm Password",
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
                           press:signUp,
                          //() {
                          //
                          // },
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

  // Future<void> signIn() async {
  //   final formState = _formKey.currentState;
  //   if (formState.validate()) {
  //     formState.save();
  //     try {
  //       await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: _email, password: _password);
  //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home()));
  //     } catch (e) {
  //       print(e.message);
  //     }
  //   }
  // }

  void signUp() async{

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:_rEmail,
          password: _rPassword,
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainTODO()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

    } catch (e) {
      print(e);
    }
  }



void Login() async{
 try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _email,
    password:_password

  );
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainTODO()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  }



}
