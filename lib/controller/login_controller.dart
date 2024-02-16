import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/model/login_model.dart';
import 'package:getx_api/views/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var loginData = LoginModel().obs;

  void checkLogin(String username, String password) async{
    var rsp = await http.post(Uri.parse('https://dummyjson.com/auth/login?username=$username&password=$password'),
    body: jsonEncode({
      'username' : username,
      'password' : password,
    }),headers: ({
          'Content-type' : 'application/json'
        }));
    print(rsp.body);
    print(rsp.statusCode);
    var data = jsonDecode(rsp.body);
    if(rsp.statusCode == 200){
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('tokenValue', data['token']);
      var box = GetStorage();
      box.write('loginToken', data['token']);
      Get.snackbar('Successfully Login '+ username.toString().toUpperCase(), 'Verified',backgroundColor: Colors.green,colorText: CupertinoColors.white);
      Get.to(HomePage());
    }else if(rsp.statusCode == 400){
      Get.snackbar(data['message'], 'Please try again',backgroundColor: Colors.red,colorText: CupertinoColors.white);
    }
  }
}