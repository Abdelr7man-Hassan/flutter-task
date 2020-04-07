import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Map data = {};
  int num=0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data =ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    Icon(

                        Icons.share,
                      color:Colors.black,
                    ),
                  ],
                ),
                leading:IconButton(icon: Icon(Icons.arrow_back,color:Colors.black,),
                 onPressed: (){setState(() {
                   num=(num+1)%4;
                 });},
                ),
                flexibleSpace: Image(
                  image: NetworkImage('${data['img$num']}'),
                    fit: BoxFit.cover,
                  height:200.0,
                )
            )
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${data['title']}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ArbicFont',
                      )),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.today,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${data['date']}',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'ArbicFont',
                            )),
                      ),
                    ],
                  ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.person_pin_circle
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                      child:Text(
                          '${data['address']}',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'ArbicFont',
                        )
                      )
                    ),
                  ],
                ),
                  Center(child:Text('-------------------------',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  Row(
                    children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage('${data['trainerImg']}'),
                    ),
                      Text('${data['trainerName']}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ArbicFont',
                          )),
                    ],
                  ),
                  Text('${data['trainerInfo']}',
                      style: TextStyle(
                        fontSize: 15.0,
//                    fontWeight: FontWeight.bold,
                        fontFamily: 'ArbicFont',
                      )
                  ),
                  Center(child:Text('-------------------------',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  Text('عن الدورة',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ArbicFont',
                      )),
                Text(
                    '${data['occasionDetail']}',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'ArbicFont',
                    )
                ),
                  Center(child:Text('-------------------------',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                  Container(
                    child: Text('تكلفة الدورة',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArbicFont',
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                     Text(
                        'السعر',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ArbicFont',
                        )
                    ),
                      Text(
                          '${data['price']}SAR',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ArbicFont',
                          )
                      ),
                      ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: (){},
                          child:Text(
                              'قم بالحجز الآن',
                              style:TextStyle(
                                fontSize: 20.0,
                              ),
                          ),
                        color: Colors.purple,
                      ),
                    ],
                  )
                ],
              ),
            ),
            ],
          ),
        )
    );
  }
}
