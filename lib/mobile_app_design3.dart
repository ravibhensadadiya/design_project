import 'package:flutter/material.dart';


class Design3 extends StatefulWidget {
  const Design3({Key? key}) : super(key: key);

  @override
  State<Design3> createState() => _Design3State();
}

class _Design3State extends State<Design3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    ),padding: EdgeInsets.all(14),
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
                          child: Icon(Icons.arrow_back,size: 30,color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(margin: EdgeInsets.fromLTRB(170, 30, 0, 550),
                        child: Icon(Icons.stars_rounded,color: Colors.white,size: 30),
                        ),
                      ),
                  ],
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(margin: EdgeInsets.only(top: 15,left: 30),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("About",style: TextStyle (
                    color: Colors.black,fontSize: 20,fontFamily: 'Quicksand'
                  ),),
                  Container(margin: EdgeInsets.only(top: 10),
                    child: Text("Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Mauris nam sed cras sed\naugue sem sodales a vivamus. Massa",
                      style: TextStyle (
                        color: Colors.black54,fontSize: 15,fontFamily: 'Quicksand'
                    ),),
                  ),
                  Container(margin: EdgeInsets.only(top: 20),
                    child: Text("Gallary",
                      style: TextStyle (
                        color: Colors.black,fontSize: 20,fontFamily: 'Quicksand',
                    ),),
                  ),
                  Row(
                    children: [
                      Container(height: 70,width: 70,
                        margin:EdgeInsets.only(top: 20) ,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/pictures_3.jpg'),
                                fit: BoxFit.cover)
                        ),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Container(height: 70,width: 70,
                        margin:EdgeInsets.only(top: 20,left: 10) ,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/pictures_1.jpg'),
                                fit: BoxFit.cover)
                        ),
                      ),
                      Container(height: 70,width: 70,
                        margin:EdgeInsets.only(top: 20,left: 10) ,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/pictures_2.jpg'),
                                fit: BoxFit.cover)
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(height: 70,width: 70,
                              margin:EdgeInsets.only(top: 20,left: 10) ,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/pictures_4.jpg'),
                                      fit: BoxFit.cover),
                              ),
                            ),Container(
                                margin: EdgeInsets.only(left: 35,top: 45, ),
                                child: Text('+7',style: TextStyle(color: Colors.white),
                                ),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(height: 60,width:425,
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                          color: Colors.red
                        ),
                        child: TextButton(onPressed: () {},
                          child: Text('Book now',
                            style: TextStyle(color: Colors.white),textAlign: TextAlign.center,
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
      ),
    );
  }
}