import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final Function(String) onSave;

  const TextFormFieldWidget({Key? key, required this.onSave}) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      autofocus: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        labelText: 'Digite seu texto',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onEditingComplete: () {
        if (textController.text.isNotEmpty) {
          widget.onSave(textController.text);
          textController.clear();
        }
      },
    );
  }
}
