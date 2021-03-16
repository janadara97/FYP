import 'package:flutter/material.dart';

import 'package:fyp/Screens/loginRegister.dart';



void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      home:LoginReg(),
    );
  }
}



