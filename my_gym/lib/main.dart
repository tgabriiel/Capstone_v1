/*
Name: Gabriel Tirado
Class: Capstone 499 - Computer Science
Project: Gym App Project using Flutter
Date: Due December 1, 2023
*/

/*
import 'dart:js_util';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
*/
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 2, 0, 5)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SharedPreferences {
  static getInstance() {}
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  List<String> daily = [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> page = [
      WorkoutTracking(),
      CurrentWorkout(),
      CalorieTracking(),
    ];
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: page[selectedIndex],
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey,
                gap: 10,
                padding: EdgeInsets.all(12),
                tabs: [
                  GButton(
                    icon: Icons.fitness_center,
                    text: 'Workout tracking',
                  ),
                  GButton(
                    icon: Icons.food_bank,
                    text: 'Current workout',
                  ),
                  GButton(
                    icon: Icons.incomplete_circle,
                    text: 'Calorie tracking',
                  )
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ));
    });
  }
}

//This is where you select the workouts you want to keep track of
class WorkoutTracking extends StatelessWidget {
  final List<String> workouts = [
    'Deadlift',
    'Pull up',
    'Seated row',
    'Squats',
    'Bench Press',
    'Lunge',
    'Curls'
  ];
  final List<int> workoutTimes = <int>[];

  /*void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      msgCount.insert(0, 0);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    const title = "Workouts";
    return MaterialApp(
        title: 'Workouts',
        home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: ListView.builder(
              itemCount: workouts.length,
              prototypeItem: ListTile(
                title: Text(workouts.first),
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(workouts[index]),
                  tileColor: Color.fromARGB(255, 222, 228, 227),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text('Add to current workout'),
                  ),
                );
              }),
        ));
  }
}

//This is where the calorie tracking portion of the program begins
class CurrentWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Current workout"),
      ),
    );
  }
}

//This is where the calorie tracking portion of the program begins
class CalorieTracking extends StatelessWidget {
  int totalCal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Color.fromARGB(255, 43, 43, 46),
          backgroundColor: Color.fromARGB(255, 162, 105, 226),
          title: Text('Calorie Tracker'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0),
              child: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FilledButton(
                    onPressed: () {
                      totalCal = totalCal + 10;
                      print(totalCal);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "10 Calories added. $totalCal Calories today."),
                          duration: Duration(seconds: 0, milliseconds: 500)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text('Add 10 Calories'),
                  ),
                  FilledButton(
                    onPressed: () {
                      totalCal = totalCal + 25;
                      print(totalCal);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('25 Calories added. ' +
                              totalCal.toString() +
                              " Calories today."),
                          duration: Duration(seconds: 0, milliseconds: 500)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text('Add 25 Calories'),
                  ),
                  FilledButton(
                    onPressed: () {
                      totalCal = totalCal + 50;
                      print(totalCal);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("50 Calories added. $totalCal today."),
                          duration: Duration(seconds: 0, milliseconds: 500)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text('Add 50 Calories'),
                  ),
                  FilledButton(
                    onPressed: () {
                      totalCal = totalCal + 100;
                      print(totalCal);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("100 Calories added. $totalCal today."),
                          duration: Duration(seconds: 0, milliseconds: 500)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text('Add 100 Calories'),
                  ),
                  FilledButton(
                    onPressed: () {
                      totalCal = totalCal + 250;
                      print(totalCal);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("250 Calories added. $totalCal today."),
                          duration: Duration(seconds: 0, milliseconds: 500)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text('Add 250 Calories'),
                  ),
                  FilledButton(
                    onPressed: () {
                      totalCal = totalCal + 500;
                      print(totalCal);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("500 Calories added. $totalCal today."),
                          duration: Duration(seconds: 0, milliseconds: 500)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text('Add 500 Calories'),
                  ),
                  FilledButton(
                    onPressed: () {
                      totalCal = totalCal + 1000;
                      print(totalCal);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('1,000 Calories added. ' +
                              totalCal.toString() +
                              " Calories today."),
                          duration: Duration(seconds: 0, milliseconds: 500)));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text('Add 1000 Calories'),
                  ),
                  FilledButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(totalCal.toString() + " Calories today."),
                        duration: Duration(seconds: 0, milliseconds: 500),
                      ));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 57, 116, 86))),
                    child: Text("Click here to print total calories"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
