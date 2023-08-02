import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Model/programModel.dart';

class Programs extends StatefulWidget {
  const Programs({super.key});

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {

  List<Program> programs = [];

  Future getData() async {
    Response response = await get(Uri.https('632017e19f82827dcf24a655.mockapi.io', 'api/programs'));
    var jsonData = jsonDecode(response.body);

    for (var eachPro in jsonData['items']){
      final pro = Program(
        name: eachPro['name'],
        category: eachPro['category'],
        lesson: eachPro['lesson'],
      );
      programs.add(pro);
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
                'Programs For You',
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
                      fontSize: 16,
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
            height: screenHeight * 0.36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: programs.length,
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
                          'assets/Pro.png',
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
                                      programs[index].category,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        color: Color(0xFF598BED),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(programs[index].name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(programs[index].lesson.toString() + ' lessons',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      color: Colors.grey.shade500,
                                    ),
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
        } else {
          // otherwise, show a loading indicator
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}