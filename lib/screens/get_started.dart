import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key, required this.title});
  final String title;

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'background',
                child: Image.asset(
                  'assets/images/bmi.png',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 21),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'Your BMI'),
                    ),
                  );
                },
                child: Text('Calculate Your BMI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
