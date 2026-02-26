

import 'package:flutter/material.dart';
//import 'package:quiz_app/second_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchscreen, {super.key});
 final Function() switchscreen ; 
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(172, 254, 254, 254),
            ),
            SizedBox(height: 20),
            Text(
              "Learn flutter",
              style: TextStyle(fontSize: 28, color: const Color.fromARGB(193, 255, 255, 255)),
            ),
            SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: (){switchscreen();},
              icon: Icon(Icons.arrow_circle_right_rounded),
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 4, 0, 0),
              ),
              label: Text(
                'start quiz',
                style: TextStyle(
                  color: const Color.fromARGB(255, 252, 252, 252),
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}
