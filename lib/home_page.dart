import 'package:flutter/material.dart';
import 'exam_page.dart';
import 'addition_page.dart';
import 'division_page.dart';
import 'info.dart'; // استيراد صفحة المعلومات

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'الصفحة الرئيسية',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.indigo[100],
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exam()),
                );
              },
              child: Text('ابدأ امتحان الضرب'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdditionPage()),
                );
              },
              child: Text('ابدأ امتحان الجمع'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DivisionPage()),
                );
              },
              child: Text('ابدأ امتحان القسمة'),
            ),
          ],
        ),
      ),
    );
  }
}
