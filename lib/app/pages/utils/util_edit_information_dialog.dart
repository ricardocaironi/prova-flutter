import 'package:flutter/material.dart';

class EditInformationDialog {
  static Future<String?> show(BuildContext context, String initialText) async {
    TextEditingController textController = TextEditingController(text: initialText);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Informação'),
          content: TextFormField(
            controller: textController,
            decoration: const InputDecoration(labelText: 'Novo texto'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cancela a edição
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                String newText = textController.text;
                Navigator.of(context).pop(newText); // Confirma a edição
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
