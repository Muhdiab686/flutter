import 'dart:convert';
import 'package:pro/core/app_endpoint.dart';
import 'package:pro/data/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:pro/data/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static Future<ApiResponse> login(String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      var response = await http.post(Uri.parse(EndPoint.loginUrl),
          body: {"email": email, "password": password});
      print(response.body);
      if (response.statusCode == 200) {
        apiResponse.data = User.fromJson(json.decode(response.body));
      } else {
        apiResponse.error = "Please validate error";
      }
    } catch (e) {
      print(e);
      apiResponse.error = "Server Error";
    }
    return apiResponse;
  }

  static Future<ApiResponse> register(String email, String password,
      String name) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      var response = await http.post(Uri.parse(EndPoint.registerUrl),
          headers: {"Accept": "application/json"},
          body: {"email": email, "password": password, "name": name});

      if (response.statusCode == 200) {
        apiResponse.data = User.fromJson(json.decode(response.body));
      } else {
        print(response.body);
        apiResponse.error = "Please validate error";
      }
    } catch (e) {
      apiResponse.error = "Server Error";
    }
    return apiResponse;
  }

  static Future<ApiResponse> verfiyCode(String code) async {
    ApiResponse apiResponse = ApiResponse();
    String token = await getToken();
    try {
      var response = await http.post(Uri.parse(EndPoint.verfiyCodeUrl),
          body: {"code": code}, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200) {
        apiResponse.data = json.decode(response.body);
      } else {
        apiResponse.error = "Please validate error";
      }
    } catch (e) {
      apiResponse.error = "Server Error";
    }
    return apiResponse;
  }

  static Future<ApiResponse> resendCode(String email) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      var response = await http
          .post(Uri.parse(EndPoint.resendCodeUrl), body: {"email": email});

      if (response.statusCode == 200) {
        apiResponse.data = json.decode(response.body)["message"];
      } else {
        apiResponse.error = "Please validate error";
      }
    } catch (e) {
      apiResponse.error = "Server Error";
    }
    return apiResponse;
  }

  static saveUser(User user) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("user", json.encode(user.toJson()));
  }

  static getToken() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.getString("user") == null) {
      return "";
    }
    String userString = sh.getString("user")!;
    var user = json.decode(userString);
    return user['token'];
  }

  static getUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String userString = sh.getString("user")!;
    User user = User.fromJson(json.decode(userString));
    return user;
  }

  static userVerfiy() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    bool user = sh.getBool("user_verfiyed") ?? false;

    return user;
  }

  static setUserVerfiy() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setBool("user_verfiyed", true);
  }

  static removeUserVerfiy() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setBool("user_verfiyed", false);
  }

  static removetoken() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.getString("user") == null) {
      return "";
    }
    String userString = sh.getString("user")!;
    Map e = {
      "id": json.decode(userString)['id'],
      "email": json.decode(userString)['email'],
      "token": "",
      "name": json.decode(userString)['name']
    };
    sh.setString("user", json.encode(e));
  }
}
