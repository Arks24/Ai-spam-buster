import 'package:ai_spam_call/BottomNavBar.dart';
import 'package:ai_spam_call/Homescreen/ProfileScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/profile': (context) => ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: BottomBar(
        initialIndex: 2,
        onTabSelected: (index) {
          // Handle the profile tab selection
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}
