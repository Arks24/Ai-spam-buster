import 'package:ai_spam_call/Homescreen/AiVideos.dart';
import 'package:ai_spam_call/Homescreen/AiVoices.dart';
import 'package:ai_spam_call/wigets/appbarAi.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarAi(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "ACTIVE",
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: _isActive,
                        onChanged: (bool value) {
                          setState(() {
                            _isActive = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/homescreen.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "AI TEMPLATES",
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AiVoices()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFFC50A0A),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  'AI VOICES',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'BebasNeue',
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset("assets/images/mic.png")
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AiVideos()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFFC50A0A),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(width: 10),
                                const Text(
                                  'AI VIDEOS',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'BebasNeue',
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset("assets/images/video.png")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "MY AI Recent work",
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                        // border: Border.all(color: Colors.black)
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 120),
                            child: TabBar(
                              dividerColor: Colors.white,
                              indicatorColor: Color(0xFFC50A0A),
                              labelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 0.5,
                              tabs: [
                                Tab(
                                    child: Text(
                                  "My Audio",
                                  style: TextStyle(
                                    fontFamily: 'Sansita',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                )),
                                Tab(
                                    child: Text(
                                  "My Video",
                                  style: TextStyle(
                                    fontFamily: 'Sansita',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: TabBarView(
                              children: [
                                TabContent(data: tab1Data),
                                TabContent(data: tab2Data),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabContent extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  TabContent({required this.data});

  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  List<Map<String, dynamic>> _deletedItems = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final item = widget.data[index];
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
                final deletedItem = widget.data.removeAt(index);
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
                        widget.data.insert(index, itemToUndo);
                      });
                    },
                  ),
                ));
                // Remove item from the list
                setState(() {
                  widget.data.removeAt(index);
                });
              }
            },
          ),
        );
      },
    );
  }
}

// Sample data
List<Map<String, dynamic>> tab1Data = [
  {
    'name': 'Item 1',
    'size': '10 MB',
    'duration': '1:30',
    'image': 'assets/images/music.png',
  },
  // Add more items as needed
];

List<Map<String, dynamic>> tab2Data = [
  {
    'name': 'Item 1',
    'size': '20 MB',
    'duration': '2:00',
    'image': 'assets/images/music.png',
  },
  // Add more items as needed
];
