import 'package:design_project/mobile_app_design3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Design2 extends StatelessWidget {
  const Design2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if(snapshot.hasData){
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 300),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Design3();
                          },
                        ));
                      },
                    ),
                  ),
                  Stack(
                    children: [
                      Container(height: 45, width: 45,
                        margin: EdgeInsets.only(top: 7),
                        child: CircleAvatar(backgroundImage: NetworkImage((jsonDecode(snapshot.data!.body.toString())[2]['Image']),),
                        ),
                      ),
                      Positioned(
                        left: 5.0,
                        top: 10.0,
                        child: Container(height: 10.0, width: 40.0,
                          child: Container(height: 15, width: 15,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.5),
                              border: Border.all(color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text((jsonDecode(snapshot.data!.body.toString())[2]['Title']),
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                  Text((jsonDecode(snapshot.data!.body.toString())[2]['SubTitle1']),
                    style: TextStyle(fontSize: 25,color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey),
                    Text((jsonDecode(snapshot.data!.body.toString())[2]['Text']),
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xFFEEEEEE)),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none,
                            prefixIcon: Icon(Icons.search,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            labelText: (jsonDecode(snapshot.data!.body.toString())[2]['Text2']),
                            labelStyle: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    flex: 4,
                  ),
                  Expanded(
                    child: Container(margin: EdgeInsets.only(left: 15),
                        height: 47,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),),
                        child: Icon(Icons.keyboard_voice,)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text((jsonDecode(snapshot.data!.body.toString())[2]['Title2']),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    Text(
                      (jsonDecode(snapshot.data!.body.toString())[2]['Title3']),
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    Text(
                      (jsonDecode(snapshot.data!.body.toString())[2]['Title4']),
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCard('Miami Beach\nthe United States', '4.7','assets/images/miami_beach.jpg'),
                    buildCard('Island Hideaway\nMaldives', '4.5','assets/images/maldives_hideway.jpg'),
                    buildCard('Best Beaches', '4.8','assets/images/best_beaches_in_the_world.jpg'),
                    buildCard('Shivrajpur beach', '4.9 ','assets/images/shivrajpur_beach.jpg'),
                  ],
                ),
              ),
            )
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

  buildCard(String title, String rating, String imgpath)  {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 275.0,
              width: 200.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: AssetImage(imgpath), fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 275.0,
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                // color: Colors.blueGrey.withOpacity(0.4)
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Row(
                children: [
                  Container(height: 40, width: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.2)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 12,),
                          SizedBox(width: 5.0,
                          ),
                          Text(rating, style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 252,
              right: 10,
              child: Row(
                children: [
                  Container(height: 30, width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.4)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite,color: Colors.blue, size: 12,
                          ),
                          SizedBox(width: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 220,
              left: 10,
              child: Container(width: 150,
                child: Text(title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 10,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Stack(
                    children: [
                      Container(height: 40, width: 100),
                      Container(height: 35, width: 35,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'data:image/jpeg;base64,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'),
                        ),
                      ),
                      Positioned(
                        left: 60,
                        child: Container(height: 35, width: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white70),
                          child: Center(
                            child: Text('+215',
                              style: TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 180,
              left: 40,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Stack(
                    children: [
                      Container(height: 35, width: 35,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/man.jpg'),
                                fit: BoxFit.cover)),
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
  }
  Future<http.Response> getDataFromWebServer() async {
    var response = await http.get(
        Uri.parse("https://63eb730af1a969340db8533f.mockapi.io/design1"));
    return response;
  }
}

// data:image/jpeg;base64,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
// Hi,Kris.
// Where would you\nlike to go?
// Manhttan,New York,USA
// Find the World
// Popular,Recommended,Cost-ef
// +215
