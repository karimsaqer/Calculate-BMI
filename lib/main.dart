import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int height = 175;
  int weight = 70;
  int age = 20;

  void _showBMIResult() {
    double bmi = (weight / pow(height / 100, 2));
    String bmiResult = bmi.toStringAsFixed(1);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('BMI Result'),
          content: Text('Your BMI is $bmiResult'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/menu.png',
          ),
        ),
      ),
      body: HomeScreen(
        onHeightChanged: (int value) {
          setState(() {
            height = value;
          });
        },
        onWeightChanged: (int value) {
          setState(() {
            weight = value;
          });
        },
        onAgeChanged: (int value) {
          setState(() {
            age = value;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: GestureDetector(
          onTap: _showBMIResult, // Show the BMI result when tapped
          child: Container(
            height: 60.0,
            child: const Center(
              child: Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class HomeScreen extends StatefulWidget {
   ValueChanged<int> onHeightChanged;
   ValueChanged<int> onWeightChanged;
   ValueChanged<int> onAgeChanged;

  HomeScreen({
    required this.onHeightChanged,
    required this.onWeightChanged,
    required this.onAgeChanged,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myHeight = 170;

  var myWeight = 70;

  var myAge = 20;

  void updateHeight(int height) {
    setState(() {
      myHeight = height;
    });
    widget
        .onHeightChanged(myHeight); // Notify the parent about the height change
  }

  void updateWeight(int weight) {
    setState(() {
      myWeight = weight;
    });
    widget
        .onWeightChanged(myWeight); // Notify the parent about the weight change
  }

  void updateAge(int age) {
    setState(() {
      myAge = age;
    });
    widget.onAgeChanged(myAge); // Notify the parent about the age change
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 15.0, bottom: 0.0),
        child: Column(children: <Widget>[
          // First Row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 2.0, bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      // color: Colors.black54,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 105,
                            color: Colors.white,
                          ),
                          Text('Male',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 2.0, bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      // color: Colors.black54,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 105,
                            color: Colors.white,
                          ),
                          Text('Female',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second Row
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 2.0, right: 2.0, top: 2.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                // color: Colors.black54,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'Height',
                          style: TextStyle(
                              color: Colors.white30,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('$myHeight',
                                style: const TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white)),
                            const Padding(
                              padding: EdgeInsets.all(2.5),
                              child: Text(
                                'cm',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white30,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          setState(() {
                            double sensitivity = 1.0;
                            myHeight += (details.delta.dx * sensitivity) as int;
                          });
                        },
                        child: const Icon(
                          Icons.drag_handle,
                          size: 50,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Third Row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 2.0, bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      // color: Colors.black54,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Weight',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white30,
                                ),
                              ),
                            ),
                            Text(
                              '$myWeight',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 38),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myWeight++;
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black54,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myWeight--;
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black54,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 45,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 2.0, bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      // color: Colors.black54,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'Age',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white30,
                                ),
                              ),
                            ),
                            Text(
                              '$myAge',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 38),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myAge++;
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black54,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myAge--;
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black54,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 45,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
