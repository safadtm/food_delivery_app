import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return Container(
                      height: Dimensions.height20 * 5,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //Image Section

                          Container(
                            width: Dimensions.height20 * 5,
                            height: Dimensions.height20 * 5,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://c4.wallpaperflare.com/wallpaper/234/543/684/food-pizza-wallpaper-preview.jpg",
                                ),
                              ),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.raduis20),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: Dimensions.width10),

                          //Details section

                          Expanded(
                            child: SizedBox(
                              height: Dimensions.height20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: "Orange Juice",
                                    color: Colors.black54,
                                  ),
                                  SmallText(text: "sweet"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: "\$ 33.0",
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: Dimensions.height10,
                                          bottom: Dimensions.height10,
                                          left: Dimensions.width10,
                                          right: Dimensions.width10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.raduis20),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  //    popularProduct
                                                  //        .setQuantity(false);
                                                },
                                                child: Icon(Icons.remove,
                                                    color:
                                                        AppColors.signColor)),
                                            SizedBox(
                                                width: Dimensions.width10 / 2),
                                            BigText(
                                                text: "0",
                                                color: Colors
                                                    .black), // popularProduct.inCartItems //  .toString(),

                                            SizedBox(
                                                width: Dimensions.width10 / 2),
                                            GestureDetector(
                                                onTap: () {
                                                  // popularProduct
                                                  //     .setQuantity(true);
                                                },
                                                child: Icon(Icons.add,
                                                    color:
                                                        AppColors.signColor)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
