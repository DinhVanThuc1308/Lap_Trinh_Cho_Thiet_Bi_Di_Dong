import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _definitionController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final List<Map<String, String>> _notes = [];

  void _saveNote() {
    final word = _wordController.text.trim();
    final definition = _definitionController.text.trim();
    final note = _noteController.text.trim();

    if (word.isNotEmpty && definition.isNotEmpty && note.isNotEmpty) {
      final newNote = {'word': word, 'definition': definition, 'note': note};
      setState(() {
        _notes.add(newNote);
        _wordController.clear();
        _definitionController.clear();
        _noteController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _wordController,
              decoration: const InputDecoration(
                labelText: 'Từ hoặc câu',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _definitionController,
              decoration: const InputDecoration(
                labelText: 'Nghĩa',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Ghi chú',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Lưu'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('Từ hoặc câu'),
                    ),
                    DataColumn(
                      label: Text('Nghĩa'),
                    ),
                    DataColumn(
                      label: Text('Ghi chú'),
                    ),
                  ],
                  rows: _notes
                      .map((note) => DataRow(cells: [
                            DataCell(Text(note['word']!)),
                            DataCell(Text(note['definition']!)),
                            DataCell(Text(note['note']!)),
                          ]))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
