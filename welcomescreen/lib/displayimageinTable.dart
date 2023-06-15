import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyApp1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Table',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



  
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageUrls = [
    'https://media.istockphoto.com/id/513895492/photo/truck-driving-on-manali-leh-national-highway-india.jpg?s=612x612&w=0&k=20&c=MXztBYSbisgq6lm7wbaQIu-NNtuBUy2M2lZtfpEVwOc=',
    // 'https://www.financialexpress.com/wp-content/uploads/2018/09/1-120.jpg?w=660',
    'https://images.91wheels.com//assets/b_images/main/models/profile/profile1662380816.jpg?width=540',
     
  ];

  List<Widget> getImageWidgets() {
    List<Widget> imageWidgets = [];
    for (String url in imageUrls) {
      imageWidgets.add(
        Container(
          margin: EdgeInsets.all(8.0),
          child: Image.network(url),
        ),
      );
    }
    return imageWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Table'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Table(
            children: [
              TableRow(
                children: [
                  for (Widget imageWidget in getImageWidgets())
                    TableCell(
                      child: imageWidget,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

