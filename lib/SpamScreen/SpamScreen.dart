import 'package:ai_spam_call/SpamScreen/CallWidget.dart';
import 'package:ai_spam_call/SpamScreen/NumberWidget.dart';
import 'package:ai_spam_call/wigets/appbarAi.dart';
import 'package:flutter/material.dart';

class SpamScreen extends StatefulWidget {
  const SpamScreen({Key? key}) : super(key: key);

  @override
  _SpamScreenState createState() => _SpamScreenState();
}

class _SpamScreenState extends State<SpamScreen> {
  int selectedContainerIndex = 0;
  bool showCallWidget = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
 appBar: AppBarAi(),      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 0;
                      showCallWidget = true;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: selectedContainerIndex == 0
                          ? Color(0xFFC50A0A)
                          : Colors.white,
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Calls",
                      style: TextStyle(
                        fontFamily: 'Sansita',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: selectedContainerIndex == 0
                            ? Colors.white
                            : Color(0xFFC50A0A),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 1;
                      showCallWidget = false;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: selectedContainerIndex == 1
                          ? Color(0xFFC50A0A)
                          : Colors.white,
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Numbers",
                      style: TextStyle(
                        fontFamily: 'Sansita',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: selectedContainerIndex == 1
                            ? Colors.white
                            : Color(0xFFC50A0A),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Spacer(),
                Visibility(
                  visible: !showCallWidget,
                  child: Row(
                    children: [
                      Text(
                        "Add new entry",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add_circle,
                        color: Colors.red,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: !showCallWidget,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Blocked Numbers",
                    style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      // border: Border.all(color: Colors.black)
                    ),
                    child: NumberWidget(),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: showCallWidget,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  // border: Border.all(color: Colors.black)
                ),
                child: CallWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
