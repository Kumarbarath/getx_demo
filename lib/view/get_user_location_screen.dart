import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_project/controller/location_controller.dart';

class GetUserLocationScreen extends StatelessWidget {
  const GetUserLocationScreen({Key? key}) : super(key: key);

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
             const  Text('Fetching the user location'),

              Text('\nLat : ${locationController.lat.value}'),
              Text('Lng : ${locationController.lng.value}'),
            ],
          ),
        ),
      ),
    );
  }
}
