import 'dart:convert';
import 'package:getx_api/model/login_model.dart';
import 'package:getx_api/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApiServices{
  static Future getApiData() async{
    var response = await http.get(Uri.parse('https://dummyjson.com/carts'));
    if(response.statusCode == 200){
      return productModelFromJson(response.body);
    }else{
      return null;
    }
  }
}