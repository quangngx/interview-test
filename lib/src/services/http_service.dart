import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  HttpService(this.url);
  final Uri url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}