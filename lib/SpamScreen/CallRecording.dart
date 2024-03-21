import 'package:flutter/material.dart';

class CallRecording extends StatelessWidget {
  const CallRecording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Call Recordings',
          style: TextStyle(
              fontSize: 26, color: Color(0xFFC50A0A), fontFamily: 'BebasNeue'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Container(
            height: 340,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: RecordingWidget(),
          )
        ]),
      ),
    );
  }
}

class RecordingWidget extends StatefulWidget {
  @override
  State<RecordingWidget> createState() => _RecordingWidgetState();
}

class _RecordingWidgetState extends State<RecordingWidget> {
  List<Map<String, dynamic>> _deletedItems = [];
  List<Map<String, dynamic>> RecordingData = [
    {
      'name': 'Item 1',
      'size': '10 MB',
      'duration': '1:30',
      'image': 'assets/images/music.png',
    },
    // Add more items as needed
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: RecordingData.length,
      itemBuilder: (context, index) {
        final item = RecordingData[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage(
              item['image'],
            ),
          ),
          title: Text(
            item['name'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size: ${item['size']}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                'Duration: ${item['duration']}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          trailing: PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 'edit',
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
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
              if (value == 'edit') {
                // Handle edit action
              } else if (value == 'delete') {
                // Handle delete action
                final deletedItem = RecordingData.removeAt(index);
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
                        RecordingData.insert(index, itemToUndo);
                      });
                    },
                  ),
                ));
                // Remove item from the list
                setState(() {
                  RecordingData.removeAt(index);
                });
              }
            },
          ),
        );
      },
    );
  }
}

List<Map<String, dynamic>> RecordingData = [
  {
    'name': 'Item 1',
    'size': '10 MB',
    'duration': '1:30',
    'image': 'assets/images/music.png',
  },
  // Add more items as needed
];
