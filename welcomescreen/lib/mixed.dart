import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ImageNetwork.dart';






class DataTableExample2 extends StatefulWidget {
  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}



class _DataTableExampleState extends State<DataTableExample2> 
{
  List<dynamic> data = []; // Holds the fetched data from the API

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getalltruckdetails'));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }



   @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

      final urlBurger =
        'https://media.istockphoto.com/id/513895492/photo/truck-driving-on-manali-leh-national-highway-india.jpg?s=612x612&w=0&k=20&c=MXztBYSbisgq6lm7wbaQIu-NNtuBUy2M2lZtfpEVwOc=';
        


       return ClipRRect(


      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color(0xFF010101),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Image.network(urlBurger,
                width: 200, height: 200, fit: BoxFit.cover),
            Text(
              'Truck Owner : Manish',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Truck Driver : Rahul',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\56000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      
    );



    
  }
      
    
}



