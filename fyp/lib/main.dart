import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Main/HomePage.dart';
import 'package:fyp/Screens/OptimalPath/MapSearch/MapSearch.dart';

import 'package:fyp/Screens/loginRegister.dart';
import 'package:fyp/screenss/database/crud/db_login_screen.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Nunito"),
      home:DbLoginScreen(),
    );
  }
}



