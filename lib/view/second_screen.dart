import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/home_controller.dart';

class SecondScreen extends StatelessWidget {

  final HomeScreenController controller=Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text('Second Screen'),
      ),
      body: Column(
        children: [
          Text('${controller.count.value}')
        ],
      ),
    );
  }
}
