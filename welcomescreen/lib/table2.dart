import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ImageNetwork.dart';



class DataTableExample1 extends StatefulWidget {
  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}



class _DataTableExampleState extends State<DataTableExample1> 
{
  late String stringResponse;
  late Map mapResponse ;
  // Holds the fetched data from the API

   Future apicall() async 
   {
        http.Response response;
        response =await  http.get(Uri.parse('http://localhost:3000/getalltruckdetails'));
        if (response.statusCode == 200) {
             setState(() {
             //  data = jsonDecode(response.body);
            //  stringResponse = response.body;
             mapResponse = jsonDecode(response.body);

      });
    } else {
      throw Exception('Failed to fetch data from API');
    }

   } 

  @override
  void initState() {
    apicall();
    super.initState();
 
  }

  @override
  Widget build(BuildContext context) {

    final String imageUrl = 'https://media.istockphoto.com/id/513895492/photo/truck-driving-on-manali-leh-national-highway-india.jpg?s=612x612&w=0&k=20&c=MXztBYSbisgq6lm7wbaQIu-NNtuBUy2M2lZtfpEVwOc='; // Replace with your image URL
    return MaterialApp(
      title: 'Image from URL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageFromUrlExample(imageUrl: imageUrl),
    );
  }
      
    
}



