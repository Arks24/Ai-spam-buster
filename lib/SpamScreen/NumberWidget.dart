import 'package:flutter/material.dart';

class CallWidget extends StatefulWidget {
  const CallWidget({Key? key}) : super(key: key);

  @override
  State<CallWidget> createState() => _CallWidgetState();
}

class _CallWidgetState extends State<CallWidget> {
  List<Map<String, dynamic>> callData = [
    {
      'date': '12 March',
      'time': '11:12',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          callData.length,
          (index) {
            final item = callData[index];
            return ListTile(
              title: Text(
                'Incoming Call',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Sansita',
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.call_made_outlined,
                    color: Color(0xFF969696),
                    size: 15,
                  ),
                  Text(
                    item['time'],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Spacer(),
                  Text(
                    item['date'],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
