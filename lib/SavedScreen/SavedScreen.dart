import 'package:ai_spam_call/Homescreen/Preview.dart';
import 'package:ai_spam_call/wigets/appbarAi.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarAi(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(221, 113, 113, 0.4),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: Color(0xFFC50A0A),
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 0.5,
                    tabs: [
                      Tab(
                          child: Text(
                        "AI Voices",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )),
                      Tab(
                          child: Text(
                        "AI Videos",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(221, 113, 113, 0.4),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TabBarView(
                    children: [
                      buildGridViewVoice(),
                      buildGridViewVideo(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridViewVoice() {
    final List<Map<String, dynamic>> AiVoice = [
      {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 1'},
      {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 2'},
      {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 3'},
      {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 4'},
      {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 5'},
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemCount: AiVoice.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(
                  AiVoice[index]['imageUrl'],
                ),
              ),
              Text(
                AiVoice[index]['name'],
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Sansita',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget buildGridViewVideo() {
  final List<Map<String, dynamic>> AiVideos = [
    {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 1'},
    {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 2'},
    {'imageUrl': 'assets/images/demo.jpg', 'name': 'Item 3'},
  ];

  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      childAspectRatio: 1,
    ),
    itemCount: AiVideos.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              width: 140,
              height: 140,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Preview()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: 114,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(
                          AiVideos[index]['imageUrl'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    AiVideos[index]['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Sansita',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
