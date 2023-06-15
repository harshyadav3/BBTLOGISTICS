import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

import 'GetAllBuyerDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buyer Personal Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Buyer(),
    );
  }
}

class Buyer extends StatefulWidget {
  @override
  _BuyerState createState() => _BuyerState();
}

class _BuyerState extends State<Buyer> {
  late String name;
  late String email;
  late String phoneNumber;
  late String dob;
  late String address;
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
                    MaterialPageRoute(builder: (context) => NextScreen()),
                  );
                    if (_formKey.currentState!.validate()) {
                    // Perform form submission or data processing here
                    print('Name: $name');
                    print('Email: $email');
                    print('Phone Number: $phoneNumber');
                    print('Address: $address');
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
    http.Response response = await createUser('$name','$email','$phoneNumber' as String,'$address','$dob');
    
    print(response.body);
}


  Future<http.Response> createUser(String name, String email, String phoneNumber ,String address , String dateofbirth) {
    return http.post(
        Uri.parse('http://localhost:3000/buyer'),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
            'name': name,
            'email':email,
            'phoneNumber':phoneNumber,
            'address' : address,
            'dateofbirth' : dob,
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






Future<void> makePostRequest() async {
  final url = Uri.parse('http://localhost:3000/users'); // Replace with your API endpoint
  
 
  Map<String, dynamic> body1 = {
    'name': ' $name',
    'email': ' $email',
    'phonenumber' :  '$phoneNumber',
    'address' : '$address',
    'dateofbirth' : '$dob'

    // Add any other data you want to send in the body
  };
  
    
    
  
  try {
    final response = await http.post(
      url,
     //  body: jsonEncode(body),
     body: {
         "name" : "hitler",
         "email": "hitler@gmail.com"
   
     }
    );
    
    if (response.statusCode == 200) {
      // Request successful, handle the response
      print('Post request successful');
      print(response.body);
    } else {
      // Request failed, handle the error
      print('Post request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred during HTTP request
    print('Error making post request: $e');
  }
}


}
