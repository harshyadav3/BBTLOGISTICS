import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DataTableExample extends StatefulWidget {
  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
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
    var url;
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data Table Example'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Text('TruckImageURL'),
            ),
            DataColumn(
              label: Text('TruckCompanyName'),
            ),
            DataColumn(
              label: Text('TruckCapacity'),
            ),
             DataColumn(
              label: Text('TruckLocation'),
            ),
             DataColumn(
              label: Text('TruckDestination'),
            ),
             DataColumn(
              label: Text('TruckPrice'),
            ),

            // Add more DataColumn widgets for additional columns
          ],
          rows: List<DataRow>.generate(
            data.length,
            (index) => DataRow(
              cells: <DataCell>[
               // final  url =data[index]['TruckImageURL'],
               //  url =(data[index]['TruckImageURL']),
                 DataCell(Text(data[index]['TruckImageURL'])),
                // Image.network('https://picsum.photos/250?image=9'),
                  

                
                DataCell(Text(data[index]['TruckCompanyName'].toString())),
                DataCell(Text(data[index]['TruckCapacity'].toString())),
                DataCell(Text(data[index]['TruckLocation'].toString())),
                DataCell(Text(data[index]['TruckDestination'].toString())),
                DataCell(Text(data[index]['TruckPrice'].toString())),
                // Add more DataCell widgets for additional columns
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}


