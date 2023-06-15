import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import 'package:welcomescreen/table.dart';
import 'package:welcomescreen/table2.dart';

import 'GetAllBuyerDetails.dart';
import 'aftershipmentform.dart';
import 'db.dart';
import 'displayimageinTable.dart';
import 'examplewidget.dart';
import 'image.dart';
import 'imagedisplay.dart';
import 'mixed.dart';
import 'table2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enter Shipment Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShipmentForm(),
    );
  }
}

class  ShipmentForm extends StatefulWidget {
  @override
  _ShipmentFormState createState() => _ShipmentFormState();
}

class _ShipmentFormState extends State<ShipmentForm> {
  // ignore: non_constant_identifier_names
  late String GoodsType;
  late String sourcecity;
  late String supplieraddress;
  late String destinationcity;
  late String destinationaddress;
  late String loaddate;
  // late String dateOfBirth;
  //late File idImage;
  //late File photo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> _pickImage(ImageSource source, bool isIdImage) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedImage != null) {
        if (isIdImage) {
        //  idImage = File(pickedImage.path);
        } else {
         // photo = File(pickedImage.path);
        }
      }
    });
  }

  Widget buildTextField({
    String? labelText,
    String? hintText,
    Function(String)? onChanged,
    bool isObscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      onChanged: onChanged,
      obscureText: isObscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buyers Registration Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              buildTextField(
                labelText: 'GoodsType',
                hintText: 'Enter your GoodsType',
                onChanged: (value) {
                  setState(() {
                    GoodsType = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'sourcecity',
                hintText: 'Enter your sourcecity',
                onChanged: (value) {
                  setState(() {
                    sourcecity = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'supplieraddress',
                hintText: 'Enter your supplieraddress',
                onChanged: (value) {
                  setState(() {
                     supplieraddress = value;
                  });
                },
              ),
               SizedBox(height: 16.0),
              buildTextField(
                labelText: 'destinationcity',
                hintText: 'Enter your destinationcity',
                onChanged: (value) {
                  setState(() {
                    destinationcity = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'destinationaddress',
                hintText: 'Enter your destinationaddress',
                onChanged: (value) {
                  setState(() {
                     destinationaddress = value;
                  });
                },
              ),
             
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'loaddate',
                hintText: 'Enter your date of loading in DD/MM/YY',
                onChanged: (value) {
                  setState(() {
                    loaddate = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text('Upload Photo'),
                trailing: Icon(Icons.photo),
                onTap: () async {
                  var gallery;
                  await _pickImage(ImageSource.gallery, false);
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DataTableExample2()),
                  );
                    if (_formKey.currentState!.validate()) {
                    // Perform form submission or data processing here
                    print('GoodsType: $GoodsType');
                    print('sourcecity: $sourcecity');
                    print('supplieraddress: $supplieraddress');
                    print('destinationcity: $destinationcity');
                    print('destinationaddress: $destinationaddress');
                   // print('Date of Birth: $dateOfBirth');
                    print('Date of Loading: $loaddate');
                   // print('Photo: $photo');
                  }
                   fun();
                },
                child: Text('Search for Trucks'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void fun() async {
    http.Response response = await createShipment('$GoodsType','$sourcecity','$supplieraddress','$destinationcity','$destinationaddress','$loaddate');
    
    print(response.body);
}


  Future<http.Response> createShipment(String GoodsType, String sourcecity, String supplieraddress,String destinationcity , String destinationaddress,String loaddate ){
    return http.post(
        Uri.parse('http://localhost:3000/shipment'),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
            'GoodsType':  GoodsType,
            'sourcecity': sourcecity,
            'supplieraddress': supplieraddress,
            'destinationcity' :  destinationcity,
            'destinationaddress' : destinationaddress,
            'loaddate' : loaddate
        }),
    );
  }
 
  
   
  
Future<void> makePostRequest2() async 
{
  Map data = 
  {
    'key1': 1,
    'key2': "some text"
  };

  String body = json.encode(data);
  final url = Uri.parse('http://localhost:3000/users');
  http.Response response = await http.post(
  url,
  headers: {"Content-Type": "application/json"},
    body: body,
);
}



    
 


}
