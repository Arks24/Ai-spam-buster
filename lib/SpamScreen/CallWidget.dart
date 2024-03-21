import 'package:ai_spam_call/SpamScreen/CallDetail.dart';
import 'package:flutter/material.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget({Key? key}) : super(key: key);

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  List<Map<String, dynamic>> numberData = [
    {
      'number': '1234567890',
    },
    // Add more items as needed
  ];

  List<Map<String, dynamic>> _deletedItems = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          numberData.length,
          (index) {
            final item = numberData[index];
            return ListTile(
              title: Text(
                item['number'] ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Sansita',
                ),
              ),
              trailing: PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: 'details',
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text('Details'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Delete'),
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'details') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CallDetail()),
                    );
                  } else if (value == 'delete') {
                    // Handle delete action
                    final deletedItem = numberData.removeAt(index);
                    setState(() {
                      _deletedItems.add(deletedItem);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Item deleted'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Handle undo action
                          setState(() {
                            final itemToUndo = _deletedItems.removeLast();
                            numberData.insert(index, itemToUndo);
                          });
                        },
                      ),
                    ));
                    setState(() {
                      numberData.removeAt(index);
                    });
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

