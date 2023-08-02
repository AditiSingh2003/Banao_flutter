import 'package:flutter/material.dart';
import 'ScrollSection/events.dart';
import 'ScrollSection/lessons.dart';
import 'ScrollSection/programs.dart';
import 'header.dart';


void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scroll(),
    )
  );
}
class Scroll extends StatefulWidget {
  const Scroll({super.key});

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Programs(),
            Events(),
            Lessons(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF598BED),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home, ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.device_hub_rounded ),
            label: 'Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined ),
            label: 'Profile',
          ),
      ]),
    );
  }
}
