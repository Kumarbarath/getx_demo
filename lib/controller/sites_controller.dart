import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/modal/site_modal.dart';
import 'package:new_project/services/api_service.dart';

class SitesController extends GetxController {
  // late List<Hits>? res;
  //late List<Hits>? paginationValue;
  RxBool isDataLoading = true.obs;
  RxBool hasError = false.obs;
  late int? freezeTheValue;

  RxBool isDataLoadingPagination = true.obs;
  RxBool hasErrorPagination = false.obs;

  RxList<Hits> res = List<Hits>.empty(growable: true).obs;
  RxList<Hits> paginationValue = List<Hits>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    print('initiscalling');
    try {
      isDataLoading(true);
      hasError(false);
      var url = 'https://culturenow-sandbox.el.r.appspot.com/site/search/';

      var response = await ApiService().post(url, {
        "keyword": "",
        "page": "99",
        "hitsPerPage": "10",
        "filters": "live:true"
      });

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        log(response.body);
        res.value = SiteModal.fromJson(result).hits!;
      }
      hasError(false);
    } catch (e) {
      log('Error while getting data is $e');
      hasError(true);
    } finally {
      isDataLoading(false);
    }
  }

  Future<void> loadMoreData(number) async {
    print('PageNumber:freezeTheValue==null? ${number.toString()} :freezeTheValue ${number}');
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Loading',
        message: 'Loading',
        icon: Icon(Icons.refresh),
        duration: const Duration(seconds: 1),
      ),
    );

    try {
      isDataLoadingPagination(true);
      hasErrorPagination(false);
      var url = 'https://culturenow-sandbox.el.r.appspot.com/site/search/';

      var response = await ApiService().post(url, {
        "keyword": "",
        "page": freezeTheValue==null?'${number.toString()}':freezeTheValue,
        "hitsPerPage": "10",
        "filters": "live:true"
      });

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        // log(response.body);
        paginationValue.value = await SiteModal.fromJson(result).hits!;

        if (paginationValue.value.isEmpty) {

          freezeTheValue=number.obs();
          print('freezevalue:${freezeTheValue}');
          Get.showSnackbar(
            const GetSnackBar(
              title: 'No more data',
              message: 'no data found',
              icon: Icon(Icons.refresh),
              duration: const Duration(seconds: 1),
            ),
          );


        } else {

          res.value?.addAll(paginationValue!);
          freezeTheValue=null.obs();
        }

        update();
      }
    } catch (e) {
      log('Error while getting data is $e');
      hasErrorPagination(true);
    } finally {
      isDataLoadingPagination(false);
    }
  }
}
