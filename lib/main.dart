import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/services/firebase_options.dart';
import 'package:new_project/view/map_screen.dart';
import 'package:sizer/sizer.dart';

Future<void> initializeDefault() async {
  print('Initialized');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseFirestore.instance.collection('location').doc('barath').set({
    'barath': {
      'Latitude': '12',
      'Longitude': '12',
      'Time': '${DateTime.now()}',
    }
  });
}

Future<void> main() async {
  await initializeDefault();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MapScreen(),
      );
    });
  }
}
