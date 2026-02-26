import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen(this.choices, this.switchscreen3, {super.key});
  final List<String> choices;
  final Function() switchscreen3;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < choices.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': choices[i],
      });
    }
    var num = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return Center(
      child: SizedBox(
        height: 500,
        child: Column(
          children: [
            Text(
              'You got $num out of ${choices.length} right',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...summary.map((data) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                data['user_answer'] == data['correct_answer']
                                ? Colors.green
                                : Colors.red,
                            child: Text(
                              ((data['question_index'] as int) + 1).toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  data["questions"].toString(),
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'User answer is ${data['user_answer']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'correct answer is ${data['correct_answer']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                switchscreen3();
              },
              label: Text('reset'),
              icon: Icon(Icons.refresh_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
