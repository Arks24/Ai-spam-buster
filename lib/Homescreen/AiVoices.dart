import 'package:flutter/material.dart';

class AiVoices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'AI Voices',
            style: TextStyle(
                fontSize: 26,
                color: Color(0xFFC50A0A),
                fontFamily: 'BebasNeue'),
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
                        "Anime",
                        style: TextStyle(
                          fontFamily: 'Sansita',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      )),
                      Tab(
                          child: Text(
                        "Celebrities",
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
                      buildGridView(),
                      buildGridView(),
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

  Widget buildGridView() {
    final List<Map<String, dynamic>> demoArray = [
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 1'},
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 2'},
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 3'},
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 4'},
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 5'},
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 6'},
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 7'},
      {'imageUrl': 'assets/images/demo1.jpg', 'name': 'Item 8'},
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.6,
      ),
      itemCount: demoArray.length,
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
                backgroundImage: AssetImage("assets/images/demo.jpg"),
              ),
              Text(
                demoArray[index]['name'],
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
