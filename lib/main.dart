import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    'McDonald\'s',
    'Rosco\'s Chicken & Waffles',
    'Olive Garden',
    'Pizza Hut',
    'Panda Express'
  ];

  int? currentIndex;

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'What do you want to eat?',
              textAlign: TextAlign.center,
            ),
            if (currentIndex != null)
              Text(
                restaurants[currentIndex!],
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const Padding(
              padding: EdgeInsets.only(
                top: 50,
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                updateIndex();
              },
              child: const Text('Pick Restaurants'),
              color: Colors.purple,
              textColor: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
