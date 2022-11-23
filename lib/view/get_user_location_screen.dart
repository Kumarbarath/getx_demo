import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/controller/location_controller.dart';

class GetUserLocationScreen extends StatefulWidget {
  const GetUserLocationScreen({Key? key}) : super(key: key);

  @override
  State<GetUserLocationScreen> createState() => _GetUserLocationScreenState();
}

class _GetUserLocationScreenState extends State<GetUserLocationScreen> {

  // Future<void> sendData() async{
  //
  //   FirebaseFirestore.instance
  //       .collection('location')
  //       .add({'location': 'ok'});
  // }
  Future<void> sendData() async{

    FirebaseFirestore.instance
        .collection('udit').get().then((value) => print(value));



    FirebaseFirestore.instance
        .collection('location').doc('barath').set({'barath':'done'});


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendData( );

  }

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());

    return Scaffold(
      appBar: AppBar(
        title:const Text('Fetch Location Screen'),
      ),
      body: Obx(()=>
         Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             const Text('Fetching the user location'),

              Text('\nLat : ${locationController.lat.value}'),
              Text('Lng : ${locationController.lng.value}'),
            ],
          ),
        ),
      ),
    );
  }
}
