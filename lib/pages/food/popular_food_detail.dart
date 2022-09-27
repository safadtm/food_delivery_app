// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/controller/popular_product_controller.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/widgets/food_small_detail.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    print("page Id is " + pageId.toString());
    print("product name is" + product.name.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image

          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!,
                  ),
                ),
              ),
            ),
          ),

          //top icon widets

          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),

          //Introduction of food

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.raduis20),
                  topLeft: Radius.circular(Dimensions.raduis20),
                ),
                color: Colors.white,
              ),

              //food details

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodSmallDetail(title: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: 'Introduce', color: Colors.black),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //Bottom Navigation

      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.raduis20 * 2),
            topRight: Radius.circular(Dimensions.raduis20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //-----

            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.raduis20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: '0', color: Colors.black),
                  SizedBox(width: Dimensions.width10 / 2),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),

            //-----

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.raduis20),
                color: AppColors.mainColor,
              ),
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: BigText(
                  text: "\$ ${product.price} | Add to cart",
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
