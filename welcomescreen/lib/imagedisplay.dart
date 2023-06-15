import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/getalltruckdetails'));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Display'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          final imageUrl = item['TruckImageURL'];

          return ListTile(
            title: Text(item['TruckCompanyName']),
            subtitle: Text(item['TruckDriverName']),
            leading: imageUrl != null
                ? Image.network(
                    imageUrl,
                    width: 150,
                    height:700,
                    // fit: BoxFit.cover,
                  )
                : null,
          );
        },
      ),
    );
  }
}


