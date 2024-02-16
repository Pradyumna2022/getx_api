import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_api/controller/product_details_controller.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductDetailsController productDetailsController = Get.put(ProductDetailsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(() {
        if(productDetailsController.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return ListView.builder(
              shrinkWrap: true,
              itemCount: productDetailsController.productDetailsList.value.products!.length,
              itemBuilder: (context,productIndex){
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      width: MediaQuery.sizeOf(context).width*0.9,
                      height: MediaQuery.sizeOf(context).height*0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          productDetailsController
                              .productDetailsList
                              .value
                              .products![productIndex]
                              .thumbnail
                              .toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(productDetailsController
                        .productDetailsList
                        .value
                        .products![productIndex].price
                        .toString()),
                    SizedBox(
                      height: 55,
                      width: Get.width*0.9,
                      child: ElevatedButton(
                        onPressed: (){

                        },
                        child: Text("Add to Cart",style: TextStyle(
                          color: Colors.white
                        ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                        ),
                      ),
                    )
                  ],
                );
              }
          );
        }
      }),
    );
  }
}
