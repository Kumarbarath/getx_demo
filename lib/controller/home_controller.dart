import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/modal/home_screen_modal.dart';

class HomeScreenController extends GetxController {
  final count = 0.obs;
  RxBool isDataLoading = true.obs;
  RxBool hasError = false.obs;
  List<String> imageList = <String>[].obs;
  late ResponseModal res;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void increment() {
    count.value++;
  }

  Future<void> getData() async {
    print('getData calling');
    try {
      isDataLoading(true);
      hasError(false);
      http.Response response = await http.get(
        Uri.tryParse('https://dummyjson.com/products/1')!,
      );
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        res = ResponseModal.fromJson(result).obs();
        print('object');

        print(res.images?.toList());
        res.images?.forEach((element) {
          imageList.add(element);
        });
      } else {

      }
      hasError(false);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      hasError(true);
    } finally {
      isDataLoading(false);
    }
  }
}
