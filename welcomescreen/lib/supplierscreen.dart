import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// import 'package:mongo_dart/mongo_dart.dart';

import 'dart:convert';
import 'dart:io';
import 'GetallSupplierDetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supplier Personal Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Supplier(),
    );
  }
}

class Supplier extends StatefulWidget {
  @override
  _SupplierState createState() => _SupplierState();
}

class _SupplierState extends State<Supplier> {
  late String companyname;
  late String companyemail;
  late String regid;
  // ignore: non_constant_identifier_names
  late String FoundingYear;
  late String address;
  late String dateOfbirth;
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
        title: Text('Supplier Registration Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              buildTextField(
                labelText: 'Company Name',
                hintText: 'Enter your Company Name',
                onChanged: (value) {
                  setState(() {
                    companyname = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Company Email',
                hintText: 'Enter your Company Email',
                onChanged: (value) {
                  setState(() {
                    companyemail = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Registration Id',
                hintText: 'Enter your Registration Id',
                onChanged: (value) {
                  setState(() {
                    regid = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Company Address',
                hintText: 'Enter your Company Address',
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Establishment Year',
                hintText: 'Enter the Year in which Company was Established',
                onChanged: (value) {
                  setState(() {
                    FoundingYear = value;
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
                    MaterialPageRoute(builder: (context) => SupplierScreen()),
                  );
                  if (_formKey.currentState!.validate()) {
                    // Perform form submission or data processing here
                    print('Company Name: $companyname');
                    print('Company Email: $companyemail');
                    print('Registraion ID: $regid');
                    print('Address: $address');
                    //print('Date of Birth: $dateOfbirth');
                    print('Founding_Year : $FoundingYear');
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

        http.Response response = await createBuyer('$companyname','$companyemail','$regid','$address','$FoundingYear');
    
        print(response.body);
     }


  Future<http.Response> createBuyer(String companyname, String companyemail, String regid ,String address ,String FoundingYear) {
    return http.post(
        Uri.parse('http://localhost:3000/supplier'),
        headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
            'companyname': companyname,
            'companyemail': companyemail,
            'regid':regid,
            'address' : address,
            
            'FoundingYear' : FoundingYear,
        }),
    );
  }
 

  
}
