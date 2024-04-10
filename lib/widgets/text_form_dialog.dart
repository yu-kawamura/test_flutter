import 'package:flutter/material.dart';

bool _defaulValidator(String text) => true;

class TextFormDialog extends StatefulWidget {
  const TextFormDialog({super.key, 
    required this.title,
    this.isValid = _defaulValidator,
  });

  final String title;
  final bool Function(String) isValid;

  @override
  _TextFormDialogState createState() => _TextFormDialogState();
}

class _TextFormDialogState extends State<TextFormDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  bool _enableAction = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextFormField(
        controller: _textEditingController,
        decoration: const InputDecoration(
          labelText: 'URL',
          hintText: 'https://www.example.com',
        ),
        onChanged: (String text) {
          if (widget.isValid(text)) {
            setState(() {
              _enableAction = true;
            });
          } else {
            setState(() {
              _enableAction = false;
            });
          }
        },
      ),
      actions: [
        ButtonBar(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: const Size(100,40)
              ),
              onPressed: () { 
                Navigator.pop(context);
              },
              child: const Text('close'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: const Size(100,40)
              ),
              onPressed: _enableAction
                ? () {
                    Navigator.pop(context, _textEditingController.text);
                  }
                : null,
              child: const Text('登録'),
            ),
          ]
        ),
      ],
    );
  }
}