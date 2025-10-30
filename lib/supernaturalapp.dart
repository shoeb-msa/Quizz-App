import 'package:flutter/material.dart';
import 'package:supernatural/data/questions_different.dart';
import 'package:supernatural/homepage.dart';
import 'package:supernatural/questions.dart';
import 'package:supernatural/results.dart';

class SupernaturalApp extends StatefulWidget {
  const SupernaturalApp({super.key});
  @override
  State<SupernaturalApp> createState() {
    return _SupernaturalAppState();
  }
}

class _SupernaturalAppState extends State<SupernaturalApp> {
  List<String> selectedanswers = [];
  var currentscreen = "homepage";
  // Widget? currentscreen;
  // @override
  // void initState() {
  //     currentscreen = Homepage(switchscreen);
  //    super.initState();
  // }
  void switchscreen() {
    setState(() {
      currentscreen = 'questions';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedanswers = [];
      currentscreen = 'homepage';
    });
  }

  void chooseAnswer(String answer) {
    selectedanswers.add(answer);
    if (selectedanswers.length == questions.length) {
      setState(() {
        currentscreen = 'results';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = Homepage(switchscreen);
    if (currentscreen == 'questions') {
      screenWidget = Questions(onSelectAns: chooseAnswer);
    }
    if (currentscreen == 'results') {
      screenWidget = Results(
        choosenAnswers: selectedanswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFFFF4500).withOpacity(0.5),
                blurRadius: 50,
                spreadRadius: 10,
              ),
            ],
            gradient: const RadialGradient(
              focalRadius: 80,
              center: Alignment.topCenter,
              radius: 2.2,
              colors: [
                Color(0xFFFFD700), 
                Color(0xFFFF4500), 
                Color(0xFF8B0000), 
                Color(0xFF1A0000), 
              ],
              stops: [0.0, 0.3, 0.7, 1.0],
            ),
          ),
          // child: currentscreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
