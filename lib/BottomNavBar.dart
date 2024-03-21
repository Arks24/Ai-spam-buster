import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:ai_spam_call/FileScreen/FileScreen.dart';
import 'package:ai_spam_call/Homescreen/HomeScreen.dart';
import 'package:ai_spam_call/SavedScreen/SavedScreen.dart';
import 'package:ai_spam_call/SpamScreen/SpamScreen.dart';
import 'package:ai_spam_call/Homescreen/ProfileScreen.dart';

import 'package:flutter/material.dart';
import 'package:ai_spam_call/BottomNavBar.dart';

class BottomBar extends StatefulWidget {
  final int initialIndex;
  final Function(int) onTabSelected;

  BottomBar({
    Key? key,
    required this.initialIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();

  void setSelectedTab(BuildContext context, int index) {
    final _BottomBarState? state =
        context.findAncestorStateOfType<_BottomBarState>();
    state?.setSelectedTab(index);
  }
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  late MotionTabBarController _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: widget.initialIndex,
      length: 5,
      vsync: this,
    );
  }

  void setSelectedTab(int index) {
    _motionTabBarController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const ["Files", "Saved", "Home", "Spam", "Profile"],
        icons: const [
          Icons.file_copy_sharp,
          Icons.bookmark,
          Icons.home,
          Icons.email,
          Icons.person,
        ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.grey[600],
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.red[900],
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController.index = value;
            widget.onTabSelected(value);
          });
        },
      ),
      body: TabBarView(
        controller: _motionTabBarController,
        children: <Widget>[
          FileScreen(),
          SavedScreen(),
          HomeScreen(),
          SpamScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
