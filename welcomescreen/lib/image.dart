import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final List<String> imageUrls;

  ImageList(this.imageUrls);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: imageUrls
            .map(
              (url) => Container(
                margin: EdgeInsets.all(10.0),
                child: Image.network(url),
              ),
            )
            .toList(),
      ),
    );
  }
}





class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image List Demo'),
        ),
        body: ImageList([
          'https://media.istockphoto.com/id/513895492/photo/truck-driving-on-manali-leh-national-highway-india.jpg?s=612x612&w=0&k=20&c=MXztBYSbisgq6lm7wbaQIu-NNtuBUy2M2lZtfpEVwOc=',
          'https://images.91wheels.com//assets/b_images/main/models/profile/profile1662380816.jpg?width=540',
          // 'https://example.com/image3.jpg',
        ]),
      ),
    );
  }
}
