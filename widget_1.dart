import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('https://media.istockphoto.com/id/1468178137/photo/close-up-side-view-of-an-orange-luxury-sports-car.webp?b=1&s=170667a&w=0&k=20&c=QFTkvPuIY5CEdzIYj3l7Dc9BRyOO2SVLP6rklx1N6PQ='), // Replace 'assets/tree_image.png' with the actual path to your image
            SizedBox(height: 16), // Add spacing between the image and text
            Text(
              '1975 porshe 911 carrera',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16), // Add spacing between the text and icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.thumb_up),
                SizedBox(width: 8), // Add spacing between the icons
                Icon(Icons.share),
                SizedBox(width: 8), // Add spacing between the icons
                Icon(Icons.comment),
              ],
            ),
            Text('Essential information'),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 32,
              ),
            
            Text('year: 1975'),
            Text('make : porsche'),
            Text('model: 911 carrera'),
            Text('VIN: 911540029'),
            Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 32,
              ),
              Text ('Description'),
              Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 16,
              endIndent: 16,
              height: 32,
              ),
              Text ('Photos')
          ],
        ),
      ),
    ),
  );
}
