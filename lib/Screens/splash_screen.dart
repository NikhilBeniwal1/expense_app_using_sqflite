import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:my_expenses/Screens/login_screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    Timer( Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Login_Screen();
      },));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Icon(Icons.currency_bitcoin),
      ),
    );
  }
}
