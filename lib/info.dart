import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('معلومات', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan[700],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/1.png'),
            ),
            Text(
              'عبد الرحمن الطير',
              style: TextStyle(
                  fontFamily: 'NotoNastaliqUrdu',
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'مبرمج تطبيقات',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 200,
              height: 10,
              child: Divider(
                color: Colors.blue,
              ),
            ),
            Card(
              margin: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '0956674210',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                ),
                title: Text(
                  'abd1490012@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}
