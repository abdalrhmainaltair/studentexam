import 'package:flutter/material.dart';
import 'dart:math';

class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() => _ExamState();
}

int firstnumber = 10;
int secondnumber = 0;
int result = 0;

class _ExamState extends State<Exam> {
  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    final random = Random();
    firstnumber = random.nextInt(10) + 1;
    secondnumber = random.nextInt(10) + 1;
    result = firstnumber * secondnumber;

    // إعادة تعيين الأزرار مع الخيارات العشوائية وعدم تكرار القيم
    Set<int> buttonSet = {};
    while (buttonSet.length < 4) {
      buttonSet.add(random.nextInt(100));
    }
    buttons = buttonSet.toList();
    correctAnswerIndex = random.nextInt(4);
    buttons[correctAnswerIndex] = result;
  }

  List<int> buttons = [];
  int correctAnswerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'جدول الضرب',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.indigo[100],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ':العملية الرياضية',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            '$firstnumber * $secondnumber = ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: List.generate(4, (index) {
                return Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (index == correctAnswerIndex) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Correct!'),
                            backgroundColor: Colors.green,
                            duration: Duration(milliseconds: 500),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Wrong!'),
                            backgroundColor: Colors.red,
                            duration: Duration(milliseconds: 500),
                          ));
                        }
                        generateQuestion();
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: Text(
                      buttons[index].toString(),
                    ),
                  ),
                );
              }),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('العودة إلى الصفحة الرئيسية'),
          ),
        ],
      ),
    );
  }
}
