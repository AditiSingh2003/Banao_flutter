import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      color:  Color(0xFFEEF3FD)
    ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(children: [
            Icon(Icons.menu, size: 30, color: Colors.grey.shade500,),
            Spacer(),
            Icon(Icons.search, size: 30,  color: Colors.grey.shade500,),
            SizedBox(width: 10,),
            Icon(Icons.notifications_none_outlined, size: 30, color: Colors.grey.shade500,),
          ],),

          SizedBox(height: 30,),

          Text('Hello, Priya!',
          style: TextStyle(fontSize: 30, color: Colors.black,fontFamily: 'Lora',),),

          SizedBox(height: 15,),

          Text('What do you want to learn today?', style: TextStyle(fontSize: 16, color: Colors.grey.shade500,fontFamily: 'Inter',),),

          SizedBox(height: 50,),
          // Textbutton
          Row(
            children: [
              buttons(
                ic: 'assets/Book-mark.png',
                text: 'Programs',
              ),
              SizedBox(width: 10,),
              buttons(
                ic: 'assets/help-circle.png', 
                text: 'Get help',
              ),
              SizedBox(width: 10,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              buttons(
                ic: 'assets/Icon.png',
                text: 'Learn',
              ),
              SizedBox(width: 10,),
              buttons(
                ic: 'assets/trello.png',
                text: 'Bookmarks',
              ),
              SizedBox(width: 10,),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget buttons({ic, text}) {
    return 
          Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF598BED), // Border color set to blue
                width: 2, // Border width
              ), // Background color of the container
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 25.0, right: 15.0 , bottom: 15.0),
              child: Row(
                children: [
                  Image(image: AssetImage(ic), ),
                  SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      color: Color(0xFF598BED),
                      fontSize: 16,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              )
            ),
          ),
          );
  }
}