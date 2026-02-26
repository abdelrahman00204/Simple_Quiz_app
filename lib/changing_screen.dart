import 'package:flutter/material.dart';
import 'package:quiz_app/second_screen.dart';
//import 'package:quiz_app/second_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/final_screen.dart';
class ChangingScreen extends StatefulWidget {
  const ChangingScreen({super.key});

  @override
  State<ChangingScreen> createState() {
    return _ChangingScreenState();
  }
}

class _ChangingScreenState extends State<ChangingScreen> {
  Widget? activeScreen;
  List<String> choices = [];
  @override
  void initState() {
    activeScreen = StartScreen(switchscreen);
    super.initState();
  }
  void changeAnswer(String answer){
    choices.add(answer) ;
  }
  void switchscreen() {
    setState(() {
      activeScreen = SecondScreen(changeAnswer,switchscreen2);
    });
  }
void switchscreen2() {
    setState(() {
      activeScreen = FinalScreen(choices,switchscreen3);
    });
  }
  void switchscreen3() {
    setState(() {
      choices = [] ;
      activeScreen = StartScreen(switchscreen);
    });}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 127, 46, 181),
        body: activeScreen,
      ),
    );
  }
}
