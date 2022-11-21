import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/view/get_user_location_screen.dart';
import 'package:new_project/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const GetUserLocationScreen(),
    );
  }
}

