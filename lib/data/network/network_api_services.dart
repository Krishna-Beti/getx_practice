import 'dart:convert';
import 'dart:io';

import 'package:getx_practice/data/app_exceptions.dart';
import 'package:getx_practice/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout();
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch(response.statusCode){
      case 200:
        return jsonDecode(response.body);
      case 400:
        return jsonDecode(response.body);
      default:
        throw FetchDataException();
    }
  }

  @override
  Future postApi(dynamic data, String url) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeout {
      throw RequestTimeout();
    }

    return responseJson;
  }
}