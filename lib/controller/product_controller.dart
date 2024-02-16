
import 'package:get/get.dart';
import 'package:getx_api/model/product_model.dart';
import 'package:getx_api/repos/product_api_services.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = ProductModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProductMethod();
  }
  Future<dynamic> fetchProductMethod() async{
    try{
      isLoading(true);
      var product = await ProductApiServices.getApiData();
      if(product !=null){
        productList.value = product as ProductModel;
      }
    }finally{
      isLoading(false);
    }
  }

}