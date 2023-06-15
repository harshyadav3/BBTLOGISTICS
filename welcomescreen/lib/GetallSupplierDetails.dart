import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:welcomescreen/phonescreen.dart';
import 'registerscreen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get All Suppliers Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SupplierScreen(),
    );
  }
}
class  SupplierScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get All Suppliers Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi, Welcome To Get All Suppliers Screen',
              style: TextStyle(fontSize: 38),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
               /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  submitForm()),
                );*/
                // Perform register button action
                  final name = nameController.text;
                  final email = emailController.text;

                  // Create a JSON object with the form data
                  final jsonData = {
                  'name': name,
                  'email': email,
                  };
                  String str ='http://localhost:3000/getallsuppliers';
                  var url = Uri.parse(str);
                  if (await canLaunchUrl(url))
                  {
                        await launchUrl(url);
                  }  else 
                  {
                        throw 'Could not launch $url';
                  }
                print('View All button pressed');

                
              },
              child: Text('View All Suppliers Info '),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Perform login button action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPhone()),
                );
                print('View Single button pressed');
              },
              child: Text('View Particular Data'),
            ),
          ],
        ),
      ),
    );
  }
    void submitForm() async {
    
    final name = nameController.text;
    final email = emailController.text;

    // Create a JSON object with the form data
    final jsonData = {
      'name': name,
      'email': email,
    };
    String str ='http://localhost:3000/getallsuppliers';
    var url = Uri.parse(str);
    if (await canLaunchUrl(url))
    {
          await launchUrl(url);
    } else 
    {
          throw 'Could not launch $url';
    }
   
  }

}