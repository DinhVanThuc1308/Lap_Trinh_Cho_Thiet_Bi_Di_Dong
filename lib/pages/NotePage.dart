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
  final List<Map<String, String>> _notes = []; // Tạo 1 mảng rỗng
// Hàm này sẽ được gọi khi người dùng nhấn vào nút Lưu
  void _saveNote() {
    final word = _wordController.text.trim(); // Lấy giá trị từ ô nhập liệu
    final definition =
        _definitionController.text.trim(); // Lấy giá trị từ ô nhập liệu
    final note = _noteController.text.trim(); // Lấy giá trị từ ô nhập liệu

    if (word.isNotEmpty && definition.isNotEmpty && note.isNotEmpty) {
      // Kiểm tra xem người dùng đã nhập đủ thông tin hay chưa
      final newNote = {'word': word, 'definition': definition, 'note': note};
      setState(() {
        // Thêm vào mảng _notes
        _notes.add(newNote); // Thêm vào mảng _notes
        _wordController.clear(); // Xóa giá trị ô nhập liệu
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
                            // Tạo 1 DataRow từ Map
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
