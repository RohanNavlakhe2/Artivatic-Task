import 'dart:convert';

import 'package:artivatic_task/model/home_data.dart';
import 'package:artivatic_task/network/custom_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkCall {
  //Creating Private Constructor so that api class intance shoule not be created outside this class.
  NetworkCall._constructor() {}

  static final NetworkCall networkCall = NetworkCall._constructor();

  final String _BASE_URL = "https://run.mocky.io/v3/";

  Future<HomeData> getHomeData() async {
    String body = await _handleGetRequest("c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf");
    return HomeData.fromJson(jsonDecode(body));
  }

  Future<String> _handleGetRequest(String endpoint) async {
    debugPrint("Req : $endpoint");
    try {
      http.Response httpResponse = await http.get(
        _BASE_URL + endpoint,
        headers: {"Content-type": "application/json"},
      ).timeout(Duration(seconds: 10), onTimeout: () {
        //10sec
        debugPrint("GET Req Timeout");
        throw TimeoutException();
      });

      if (httpResponse.statusCode == 200)
        //return httpResponse.body;
        //Made it utf8.decode(httpResponse.bodyBytes) because some fonts Ex. Arabic,Urdu,Japanese were
        //not loading with httpResponse.body
        return utf8.decode(httpResponse.bodyBytes);

      throw CustomException("Something went wrong,please try again");
    } on Exception catch (e) {
      throw CustomException("Something went wrong Please try again");
    }
  }
}