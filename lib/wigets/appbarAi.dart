import 'package:ai_spam_call/BottomNavBar.dart';
import 'package:flutter/material.dart';

class AppBarAi extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "AI SPAM CALL",
        style: TextStyle(
          fontFamily: 'MedulaOne',
          color: Color(0xFFC50A0A),
          fontWeight: FontWeight.w400,
          fontSize: 30,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            size: 20,
          ),
        ),
      ],
      leading: GestureDetector(
        onTap: () {
          BottomBar(
            initialIndex: 4,
            onTabSelected: (int) {},
          ).setSelectedTab(context, 4); // Update the bottom bar to profile tab
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            radius: 15,
            child: Icon(Icons.person),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
