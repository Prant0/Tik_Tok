import 'package:flutter/material.dart';
import 'package:tok_tok/widget/brand_colors.dart';
import 'package:tok_tok/widget/constant.dart';
import 'package:tok_tok/widget/custom_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: aBackgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 22,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 22,
              ),
              label: "search"),
          BottomNavigationBarItem(icon: CustomIcon(), label: " "),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: 22,
              ),
              label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 22,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
