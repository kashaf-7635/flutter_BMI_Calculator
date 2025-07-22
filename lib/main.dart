import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(title: 'Your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "The result shows here";
  Color bgColor = Colors.deepPurple.shade100;
  var _width = 300.0;
  var _height = 400.0;
  var _border_radius = 10.0;
  var text_opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Container(
        color: Colors.deepPurple.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'background',
              child: Image.asset(
                'assets/images/bmi.png',
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 11),
            Center(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(_border_radius),
                ),
                duration: Duration(seconds: 1),
                curve: Curves.bounceInOut,
                width: _width,
                height: _height,

                padding: EdgeInsets.all(8.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text(
                    //   'BMI',
                    //   style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    // ),
                    // SizedBox(height: 11),
                    TextField(
                      controller: wtController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text('Enter you weight (in Kgs)'),
                        prefixIcon: Icon(Icons.line_weight),
                      ),
                    ),
                    SizedBox(height: 11),
                    TextField(
                      controller: ftController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text('Enter you height (in Feet)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                    ),
                    SizedBox(height: 11),
                    TextField(
                      controller: inController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text('Enter you height (in Inch)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            var wt = wtController.text.toString();
                            var ft = ftController.text.toString();
                            var inch = inController.text.toString();
                            text_opacity = 1.0;
                            if (wt != "" && ft != "" && inch != "") {
                              //calculation
                              var iWt = int.parse(wt);
                              var iFt = int.parse(ft);
                              var iInch = int.parse(inch);

                              var tInch = (iFt * 12) + iInch;
                              var tCm = tInch * 2.54;
                              var tM = tCm / 100;

                              var bmi = iWt / (tM * tM);
                              var msg = '';

                              if (bmi > 25) {
                                msg = 'You are OverWeight!';
                                bgColor = Colors.orange.shade200;
                              } else if (bmi < 18) {
                                msg = 'You are UnderWeight!';
                                bgColor = Colors.red.shade200;
                              } else {
                                msg = 'You are Healthy!';
                                bgColor = Colors.green.shade200;
                              }
                              _width = 400.0;
                              _height = 450.0;
                              _border_radius = 20.0;

                              setState(() {
                                result =
                                    '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                              });
                            } else {
                              setState(() {
                                result =
                                    "Please fill all the required blanks!!";
                              });
                            }
                          },
                          child: Text('Calculate'),
                        ),

                        IconButton(
                          iconSize: 30,
                          color: Colors.deepPurple,
                          splashColor: Colors.deepPurpleAccent,
                          highlightColor: Colors.purple[100],
                          padding: EdgeInsets.all(8),
                          tooltip: 'Reset Fields',
                          onPressed: () {
                            text_opacity = 0.0;
                            FocusScope.of(context).unfocus();

                            setState(() {
                              wtController.clear();
                              ftController.clear();
                              inController.clear();
                              result = "The result shows here";
                              bgColor = Colors.deepPurple.shade100;
                              _width = 300.0;
                              _height = 400.0;
                              _border_radius = 10.0;
                            });
                          },
                          icon: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    AnimatedOpacity(
                      opacity: text_opacity,
                      duration: Duration(seconds: 3),
                      // curve: Curves.bounceInOut,
                      child: Text(
                        result,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
