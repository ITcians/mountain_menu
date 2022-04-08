
import 'package:flutter/material.dart';
import 'package:mountain_menu/mountain_menu.dart';

class MenuDemo extends StatefulWidget {
  const MenuDemo({Key? key}) : super(key: key);

  @override
  State<MenuDemo> createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {
  List<String> menus = ["SETTINGS", "SEARCH", "NOTIFICATIONS","HOME","PROFILE"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://avatars.githubusercontent.com/u/93488670?s=400&u=af911b0e99e78a599f08f47f1e3152700b869f6b&v=4"),
            const Text(
              "The ITcians",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Cursive",
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            Text(
              menus[selectedIndex],
              style: const TextStyle(
                  color: Color(0xff9264EB),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MountainMenu(
        color: const Color(0xff9264EB),
        menuIcon: Icons.menu,
        mainButtonElevation: 0,
        mini: false,
        curve: Curves.bounceOut,
        buttonBackgroundColor: Colors.white,
        onChange: (val) async {
          setState(() {
            selectedIndex = val;
          });
        },
        menus: const [
          Icon(
            Icons.settings,
            color: Color(0xff9264EB),
          ),
          Icon(
            Icons.search,
            color: Color(0xff9264EB),
          ),
          Icon(
            Icons.chat_bubble,
            color: Color(0xff9264EB),
          ),Icon(
            Icons.home,
            color: Color(0xff9264EB),
          ),Icon(
            Icons.person,
            color: Color(0xff9264EB),
          ),
        ],
      ),
    );
  }
}
