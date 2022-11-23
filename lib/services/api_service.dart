import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<dynamic> getHeader() async {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<dynamic> get(String url) async {

    Map<String, String> header = await getHeader();

    try {
      final http.Response response = await http
          .get(
            Uri.parse(url),
            headers: header,
          )
          .timeout(Duration(seconds: 10));
      return response;
    } on SocketException {
      return {'message': 'No Internet Connection'};
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    Map<String, String> header = await getHeader();
    try {
      final http.Response res = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: header,
          )
          .timeout(Duration(seconds: 10));

      return res;
    } on SocketException {
      return {'message': 'No Internet Connection'};
    }
  }


}
