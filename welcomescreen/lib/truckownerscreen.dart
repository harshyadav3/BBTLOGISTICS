import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:mongo_dart/mongo_dart.dart';

import 'dart:convert';
import 'dart:io';
import 'GetallTruckOwnerDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truck Personal Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TruckOwner(),
    );
  }
}

class TruckOwner extends StatefulWidget {
  @override
  _TruckOwnerState createState() => _TruckOwnerState();
}

class _TruckOwnerState extends State<TruckOwner> {
  late String name;
  late String email;
  late String phoneNumber;
  late String dob;
  late String truckcompanyname;
  late String nooftruck;
  late String yearofpurchase;
  late String address;
  late String dateOfBirth;
  late File idImage;
  late File photo;
  final _formKey = GlobalKey<FormState>();
  Future<void> _pickImage(ImageSource source, bool isIdImage) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedImage != null) {
        if (isIdImage) {
          idImage = File(pickedImage.path);
        } else {
          photo = File(pickedImage.path);
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
        title: Text('Truck Owner Registration Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              buildTextField(
                labelText: 'Name',
                hintText: 'Enter your name',
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Email',
                hintText: 'Enter your email',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Total Truck Available',
                hintText: 'Enter the total truck available ',
                onChanged: (value) {
                  setState(() {
                    nooftruck = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Truck Company Name',
                hintText: 'Enter the name of truck company',
                onChanged: (value) {
                  setState(() {
                    truckcompanyname = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Year Of Purchase',
                hintText: 'Enter Purchasing Year of Truck',
                onChanged: (value) {
                  setState(() {
                    yearofpurchase = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Address',
                hintText: 'Enter your address',
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'DOB',
                hintText: 'Enter your DOB in DD/MM/YY',
                onChanged: (value) {
                  setState(() {
                    dob = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TruckOwnerScreen()),
                  );
                  if (_formKey.currentState!.validate()) {
                    // Perform form submission or data processing here
                    print('Name: $name');
                    print('Email: $email');
                    print('Phone Number: $phoneNumber');
                    print('Address: $address');
                    print('Total Truck Number: $nooftruck');
                    print('Purchasing Year: $yearofpurchase');
                    print('Truck Company Name : $truckcompanyname');
                   // print('Date of Birth: $dateOfBirth');
                    print('Date of Birth: $dob');
                    // print('Photo: $photo');
                  }
                  fun();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
   void fun() async {

        http.Response response = await createTruckOwner('$name','$email','$phoneNumber','$address','$nooftruck', '$yearofpurchase','$truckcompanyname','$dob');
    
        print(response.body);
     }


  Future<http.Response> createTruckOwner(String name, String email, String phoneNumber ,String address ,String nooftruck,String yearofpurchase, String truckcompanyname, String dob) {
    return http.post(
        Uri.parse('http://localhost:3000/truckowner'),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
            'name': name,
            'email': email,
            'phoneNumber':phoneNumber,
            'address' : address,
            'nooftruck' : nooftruck,
            'yearofpurchase' : yearofpurchase,
           
            'truckcompanyname' : truckcompanyname,
            'dob' : dob,
        }),
    );
  }
}
