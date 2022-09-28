import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      title: "Weather",
    );

  }
}

