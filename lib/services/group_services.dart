import 'dart:convert';
import 'package:pro/core/app_endpoint.dart';
import 'package:pro/data/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:pro/data/model/user.dart';
import 'package:pro/data/model/user_model.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/group.dart';

class GroupServices {
  static Future<ApiResponse> getGroup() async {
    ApiResponse apiResponse = ApiResponse();
    String token=await AuthServices.getToken();
    try {
      var response = await http.get(Uri.parse(EndPoint.getGroupUrl),
          headers: {"Authorization":"Bearer $token"});

      if (response.statusCode == 200) {
        apiResponse.data = json.decode(response.body)['group'].map((e)=>Group.fromJson(e)).toList();
      } else {
        print(response.body);
        apiResponse.error = "Please validate error";
      }
    } catch (e) {
      print(e);
      apiResponse.error = "Server Error";
    }
    return apiResponse;
  }

  static Future<ApiResponse> createGroup(String name,List<int>?members) async {
    Map body={"name": name};
    if(members!.isNotEmpty){
      print(members.toString());
      body={"name": name,"members":members};
    }
    print(body);
    ApiResponse apiResponse = ApiResponse();
    String token = await AuthServices.getToken();
    try {
      var response = await http.post(Uri.parse(EndPoint.createGroupUrl),
          body: json.encode(body), headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        apiResponse.data = json.decode(response.body);
      } else {    print(response.body);
        apiResponse.error = "Please validate error";
      }
    } catch (e) {
      print(e);
      apiResponse.error = "Server Error";
    }
    return apiResponse;
  }
  static Future<ApiResponse> getUser() async {
    ApiResponse apiResponse = ApiResponse();
    String token=await AuthServices.getToken();
    try {
      var response = await http.get(Uri.parse(EndPoint.getUserGroupUrl),
          headers: {"Authorization":"Bearer $token"});

      if (response.statusCode == 200) {
        apiResponse.data = json.decode(response.body)['user'].map((e)=>UserModel.fromJson(e)).toList();
      } else {
        apiResponse.error = "Please validate error";
      }
    } catch (e) {
      print(e);
      apiResponse.error = "Server Error";
    }
    return apiResponse;
  }
}