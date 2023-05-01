import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final TextEditingController _textController = TextEditingController();
  String _translatedText = "";
  final GoogleTranslator _translator = GoogleTranslator();

  void _translateText() {
    _translator.translate(_textController.text, to: 'vi').then((translation) {
      setState(() {
        _translatedText = translation.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dịch Tiếng Hàn Sang Tiếng Việt'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nhập văn bản tiếng Hàn cần dịch',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _translateText,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  'Dịch sang tiếng Việt',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Kết quả dịch:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _translatedText,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
