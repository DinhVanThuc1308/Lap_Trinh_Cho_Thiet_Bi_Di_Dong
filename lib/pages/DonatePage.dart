import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cảm ơn bạn đã ủng hộ!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Image.asset(
              'assets/donate.jpg',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
