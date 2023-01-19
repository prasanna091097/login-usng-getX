import 'dart:convert';
import 'package:api_app/api.dart';
import 'package:api_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefer = SharedPreferences.getInstance();

  Future<void> loginl() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(Api.baseUrl + Api.authEndpoints.loginEmail);
      Map body = {
        'username': userController.text,
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 400) {
        final json = jsonDecode(response.body);
        print('jwt token');
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefer = await _prefer;
          await prefer?.setString('token', token);
          print(response);
          userController.clear();
          passwordController.clear();
          Get.off(HomeScreen());
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        print('hi' + response.body);
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
