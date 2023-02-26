import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Design3 extends StatefulWidget {
  const Design3({Key? key}) : super(key: key);

  @override
  State<Design3> createState() => _Design3State();
}

class _Design3State extends State<Design3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: Stack(fit: StackFit.expand,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/images/nature.jpg',
                            fit: BoxFit.cover,
                          ),
                        ), padding: EdgeInsets.all(14),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.only(
                        //     topRight: Radius.circular(40.0),
                        //     bottomLeft: Radius.circular(40.0),
                        //     bottomRight: Radius.circular(40.0),
                        //     topLeft: Radius.circular(40.0),
                        //   )
                        // ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 25, 200, 550),
                                child: Icon(Icons.arrow_back, size: 30,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(170, 30, 0, 550),
                              child: Icon(
                                  Icons.stars_rounded, color: Colors.white,
                                  size: 30),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Container(margin: EdgeInsets.only(top: 15, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text((jsonDecode(snapshot.data!.body.toString())[1]['Title']),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Quicksand'
                        ),),
                        Container(margin: EdgeInsets.only(top: 10),
                          child: Text((jsonDecode(snapshot.data!.body.toString())[1]['SubTitle1']),
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontFamily: 'Quicksand'
                            ),),
                        ),
                        Container(margin: EdgeInsets.only(top: 20),
                          child: Text((jsonDecode(snapshot.data!.body.toString())[1]['Title2']),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Quicksand',
                            ),),
                        ),
                        Row(
                          children: [
                            Container(height: 70, width: 70,
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pictures_3.jpg'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                            Container(height: 70, width: 70,
                              margin: EdgeInsets.only(top: 20, left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pictures_1.jpg'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                            Container(height: 70, width: 70,
                              margin: EdgeInsets.only(top: 20, left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pictures_2.jpg'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(height: 70, width: 70,
                                    margin: EdgeInsets.only(top: 20, left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/pictures_4.jpg'),
                                          fit: BoxFit.cover),
                                    ),
                                  ), Container(
                                    margin: EdgeInsets.only(left: 35, top: 45,),
                                    child: Text((jsonDecode(snapshot.data!.body.toString())[1]['Text']),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(height: 60,
                              width: 425,
                              margin: EdgeInsets.only(top: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.red
                              ),
                              child: TextButton(onPressed: () {},
                                child: Text((jsonDecode(snapshot.data!.body.toString())[1]['Text2']),
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          else{
          return Center(child: CircularProgressIndicator());
          }
        },
    future: getDataFromWebServer(),
      ),
    );
  }

  Future<http.Response> getDataFromWebServer() async {
    var response = await http.get(
        Uri.parse("https://63eb730af1a969340db8533f.mockapi.io/design1"));
    return response;
  }
}

// About
// Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Mauris nam sed cras sed\naugue sem sodales a vivamus. Massa
// Gallary
// +7
// Book now