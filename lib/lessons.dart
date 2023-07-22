import 'package:flutter/material.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

  @override
  State<Lessons> createState() => _ProgramsState();
}

class _ProgramsState extends State<Lessons> {

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
                'Lessons for you',
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
                      fontSize: 16,
                      fontFamily: 'Inter',
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
            height: screenHeight * 0.37,
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
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        color: Color(0xFF598BED),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text('Understanding of human behaviour',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('3 min',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          color: Colors.grey.shade500,
                                        ),
                                        ),
                                        Icon( Icons.lock, size: 24, color: Colors.grey.shade500,)
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