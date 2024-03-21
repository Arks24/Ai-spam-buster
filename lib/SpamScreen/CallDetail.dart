import 'package:ai_spam_call/SpamScreen/CallRecording.dart';
import 'package:ai_spam_call/SpamScreen/NumberWidget.dart';
import 'package:flutter/material.dart';

class CallDetail extends StatelessWidget {
  const CallDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Call Details',
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CallRecording()),
              );
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  Text(
                    "Call Recordings",
                    style: TextStyle(
                      fontFamily: 'Sansita',
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right_sharp,
                    size: 30,
                  )
                ]),
              ),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
                // border: Border.all(color: Colors.black)
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Call Log",
            style: TextStyle(
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
              // border: Border.all(color: Colors.black)
            ),
            child: CallWidget(),
          ),
        ]),
      ),
    );
  }
}
