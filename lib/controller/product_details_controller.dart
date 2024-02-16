
import 'package:get/get.dart';
import 'package:getx_api/model/product_details_model.dart';
import 'package:getx_api/repos/product_details_api_services.dart';

import '../global_variables/global_variables.dart';

class ProductDetailsController extends GetxController{
  var isLoading = true.obs;
  var productDetailsList = ProductDetailsModel().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProductDetailsMethod();
  }
  void fetchProductDetailsMethod() async{
    try{
      isLoading(true);
      var product = await ProductDetailsApi.productDetailsApi(id!);
      if(product !=null){
        productDetailsList.value = product;
      }
    }finally{
      isLoading(false);
    }
  }

}