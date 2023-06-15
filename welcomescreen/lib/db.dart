import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  List<dynamic> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getalltruckdetails'));
    
    if (response.statusCode == 200) {
      print('ok');
      setState(() {
        dataList = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data List'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final item = dataList[index];
          return ListTile(
            title: Text(item['TruckCompanyName']),
            subtitle: Text(item['TruckDriverName']),
          );
        },
      ),
    );
  }
}


