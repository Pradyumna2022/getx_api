import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: loginController.emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Valid Email";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Mail',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: loginController.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Valid Password";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 60,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                      ),onPressed: (){
                        if(_formKey.currentState!.validate()){
                          loginController.checkLogin(loginController.emailController.value.text.toString(),
                              loginController.passwordController.value.text.toString());
                        }
                      }, child: Text("Login",style: TextStyle(
                          color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold
                      ),))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
