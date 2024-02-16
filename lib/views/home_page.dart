import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controller/product_controller.dart';
import 'package:getx_api/global_variables/global_variables.dart';
import 'package:getx_api/views/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductController productController = Get.put(ProductController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (productController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
            itemCount: productController.productList.value.carts!.length,
            itemBuilder: (context, cartIndex) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: productController
                      .productList.value.carts![cartIndex].products!.length,
                  itemBuilder: (context, productIndex) {
                    return GestureDetector(
                      onTap: () {
                        id = productController.productList.value.carts![cartIndex].id;
                        print(id.toString() +' this is your id when your clicking on the every item ');
                        Get.to(ProductDetailsPage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.limeAccent,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.brown,
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    productController
                                        .productList
                                        .value
                                        .carts![cartIndex]
                                        .products![productIndex]
                                        .thumbnail
                                        .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Text(productController.productList.value
                                .carts![cartIndex].products![productIndex].price
                                .toString())
                          ],
                        ),
                      ),
                    );
                  });
            });
        ;
      }
    }));
  }
}
