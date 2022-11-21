import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/home_controller.dart';
import 'package:new_project/view/get_user_location_screen.dart';

class SecondScreen extends StatelessWidget {

  final HomeScreenController controller=Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text('Second Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${controller.count.value}'),
          SizedBox(height: 10,),
          Center(
            child: SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(

                  onPressed: (){
                Get.to(()=>GetUserLocationScreen());
              }, child: Text('Go to location screen')),
            ),
          )
        ],
      ),
    );
  }
}
