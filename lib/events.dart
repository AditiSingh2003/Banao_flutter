import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _ProgramsState();
}

class _ProgramsState extends State<Events> {

  List<String> images = [
    'assets/Yoga.png',
    'assets/Yoga.png',
    'assets/Yoga.png',
  ];

  List<String> titles = [
    'BABYCARE',
    'BABYCARE',
    'BABYCARE',
  ]; 

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Events and experiences',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Text(
                    'View all',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_outlined,
                    size: 20,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: screenHeight * 0.39,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth * 0.7,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          images[index],
                          fit: BoxFit.fitWidth,
                          width: screenWidth * 0.7,
                        ),
                        SizedBox(height: 15),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      titles[index],
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 20,
                                        color: Color(0xFF598BED),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text('Understanding of human behaviour',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('13 Feb, Sunday',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          color: Colors.grey.shade500,
                                        ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add your button click action here
                                            print('Button clicked!');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white, // Background color of the button
                                            onPrimary: Colors.blue, // Text (foreground) color of the button
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20), // Rounded border radius
                                              side: BorderSide(color: Color(0xFF598BED),), // Blue border color
                                            ),
                                          ),
                                          child: Text('Book', style: TextStyle(color: Color(0xFF598BED),fontFamily: 'Inter',),)
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}