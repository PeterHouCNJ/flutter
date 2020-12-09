import 'package:flutter/material.dart';
import 'package:flutter_getx_concept/widgets/appbar_action.dart';
import 'package:flutter_getx_concept/widgets/custom_appbar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_concept/pages/product/controller.dart';
import 'package:flutter_getx_concept/utils/colors.dart';
import 'package:flutter_getx_concept/widgets/product_image.dart';

import 'widgets/product_actions.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.LIGHT,
          appBar: CustomAppBar(
            "Product",
            leadings: [
              CustomAppBarAction(
                () => Get.back(),
                Feather.arrow_left,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Obx(
                  () => ProductImage(
                    controller?.product?.image,
                    height: Get.width - 50,
                    padding: 25,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.product?.name ?? "",
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.DARK,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Obx(
                  () => Text(
                    controller.product?.priceBrl ?? "",
                    style: TextStyle(
                      fontSize: 21,
                      color: AppColors.GREEN,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: ProductActions(),
        );
      },
    );
  }
}
