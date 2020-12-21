import 'package:flutter/material.dart';
import 'package:private_album/screens/home/auth.dart';
import 'package:private_album/screens/home/add_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Root Widget
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      theme: ThemeData(fontFamily: 'Sen'),
      home: AuthScreen(),
    ));
  }
}
