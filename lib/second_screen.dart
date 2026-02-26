import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';

//import 'package:quiz_app/changing_screen.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen(this.changeAnswer, this.switchscreen2, {super.key});
  final void Function(String answer) changeAnswer;
  final Function() switchscreen2;
  @override
  State<SecondScreen> createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  var i = 0;
  @override
  Widget build(BuildContext context) {
    var answers = questions[i].getShuffled().map((item) {
      return ElevatedButton(
        onPressed: () {
          setState(() {
            if (i <= 5) {
              i = i + 1;
              widget.changeAnswer(item);
              if (i == 6) {
                widget.switchscreen2();
              }
            }
          });
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 70, 145, 183),
        ),
        child: Text(
          item,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      );
    });

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questions[i].text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              ...answers,
            ],
          ),
        ),
      ),
    );
  }
}
