import 'dart:async';

import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/get_started.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});
  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirst = true;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      animateChilds();
    });

    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GetStarted(title: 'Your BMI')),
      );
    });
  }

  void animateChilds() {
    setState(() {
      isFirst = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple.shade300,
        child: Center(
          child: AnimatedCrossFade(
            firstChild: Text(
              'BMI \n Calculator \n App',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 43,
                fontWeight: FontWeight.bold,
              ),
            ),
            secondChild: Image.asset(
              'assets/images/bmi.png',
              width: 200,
              height: 200,
            ),
            crossFadeState: isFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(seconds: 2),
            sizeCurve: Curves.fastOutSlowIn,
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.bounceInOut,
          ),
        ),
      ),
    );
  }
}
