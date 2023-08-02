import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Model/lessonModel.dart';

class Lessons extends StatefulWidget {
  const Lessons({super.key});

  @override
  State<Lessons> createState() => _ProgramsState();
}

class _ProgramsState extends State<Lessons> {

  List<LessonModel> lessons = [];

  Future getData () async {
    Response response = await get(Uri.https('632017e19f82827dcf24a655.mockapi.io', 'api/lessons'));
    var jsonData = jsonDecode(response.body);

    for (var eachLesson in jsonData['items']){
      final less = LessonModel(
        name: eachLesson['name'],
        duration: eachLesson['duration'],
        category: eachLesson['category'],
        locked: eachLesson['locked'],
      );
      lessons.add(less);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        // is it done loading?  then show data
        if(snapshot.connectionState == ConnectionState.done) {
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
              itemCount: lessons.length,
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
                          'assets/Yoga.png',
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
                                      lessons[index].category,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        color: Color(0xFF598BED),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text( lessons[index].name,
                                    maxLines: 2, // Set the maximum number of lines before truncating the text
                                    overflow: TextOverflow.ellipsis,
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
                                        Text(
                                          '${lessons[index].duration} min',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          color: Colors.grey.shade500,
                                        ),
                                        ),
                                        if (lessons[index].locked == false)
                                        Icon(
                                          Icons.lock_outline_rounded,
                                          size: 20,
                                          color: Colors.grey.shade500,
                                        ),
                                        if (lessons[index].locked == true)
                                          Icon(
                                            Icons.lock_open_rounded,
                                            size: 20,
                                            color: Colors.grey.shade500,
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
      // else show a loading indicator
      else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      }
    );
  }
}