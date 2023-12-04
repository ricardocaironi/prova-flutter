import 'package:flutter/material.dart';

class SavedInformationCard extends StatelessWidget {
  final List<String> savedInformationList;
  final Function(int) onEdit;
  final Function(int) onDelete;

  const SavedInformationCard({
    Key? key,
    required this.savedInformationList,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey.shade300,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: savedInformationList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(savedInformationList[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => onEdit(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => onDelete(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}