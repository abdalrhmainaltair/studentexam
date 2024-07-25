import 'package:flutter/material.dart';
import 'dart:math';

class DivisionPage extends StatefulWidget {
  const DivisionPage({super.key});

  @override
  State<DivisionPage> createState() => _DivisionPageState();
}

int firstNumber = 10;
int secondNumber = 1; // يجب أن لا يكون صفرًا
int result = 0;

class _DivisionPageState extends State<DivisionPage> {
  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    final random = Random();
    secondNumber = random.nextInt(9) + 1; // لضمان عدم حصولنا على صفر
    result = random.nextInt(10) + 1;
    firstNumber = secondNumber * result;

    // إعادة تعيين الأزرار مع الخيارات العشوائية
    Set<int> uniqueAnswers = {};
    while (uniqueAnswers.length < 4) {
      uniqueAnswers.add(random.nextInt(10) + 1);
    }
    buttons = uniqueAnswers.toList();
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
              'عمليات القسمة',
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
            '$firstNumber ÷ $secondNumber = ',
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
