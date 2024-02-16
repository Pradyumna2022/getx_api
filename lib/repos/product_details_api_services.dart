import 'package:getx_api/model/product_details_model.dart';
import 'package:http/http.dart' as http;
class ProductDetailsApi{
  static Future productDetailsApi(int id) async{
    var response = await http.get(Uri.parse('https://dummyjson.com/carts/$id'));
    if(response.statusCode == 200){
      return productDetailsModelFromJson(response.body);
    }else{
      return null;
    }
  }
}