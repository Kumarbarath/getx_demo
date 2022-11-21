import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controller/home_controller.dart';
import 'package:new_project/view/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter GetX State Management Demo"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.increment,
          tooltip: 'Increment',
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.add),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Center(
              child: controller.isDataLoading.value == true
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          '${controller.count.value}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 18),
                              primary: Colors.teal,
                            ),
                            onPressed: () {
                              Get.snackbar(
                                  'GetX Snackbar', 'Yay! Awesome GetX Snackbar',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.tealAccent);
                            },
                            child: const Text('Show Snackbar')),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 18),
                              primary: Colors.teal,
                            ),
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'GetX Alert',
                                  middleText: 'Simple GetX alert',
                                  textConfirm: 'Okay',
                                  confirmTextColor: Colors.white,
                                  textCancel: 'Cancel');
                            },
                            child: const Text('Show AlertDialog')),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                minimumSize: const Size.fromHeight(40),
                                primary: Colors.teal,
                              ),
                              child: Row(
                                children: const [
                                  Spacer(),
                                  Text("Go to next screen"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Icon(
                                    Icons.arrow_right_alt,
                                    size: 40,
                                  ))
                                ],
                              ),
                              onPressed: () {
                                Get.to(()=>SecondScreen());
                              }),
                       ),
                        Text(
                          '${controller.imageList.length}',
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.imageList.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network('${controller.imageList[index]}',width: double.infinity,height: 200,),
                              );

                            })
                      ],
                    ),
            ),
          ),
        ));
  }
}
