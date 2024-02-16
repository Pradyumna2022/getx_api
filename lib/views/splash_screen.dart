import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_api/controller/login_controller.dart';
import 'package:getx_api/views/auth/login_page.dart';
import 'package:getx_api/views/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      var box = GetStorage();
      var showTokenValue = box.read('loginToken');
      if(showTokenValue == null){
        print('go to login Screen');
        Get.to(LoginScreen());
      }else{
        print('go to home screen');
        Get.to(HomePage());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/logo/splashlogo.png',width: 100,)
          ],
        ),
      ),
    );
  }
}
