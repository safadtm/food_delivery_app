import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/data/controller/auth_controller.dart';
import 'package:food_delivery_app/data/controller/cart_controller.dart';
import 'package:food_delivery_app/data/controller/user_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/account_widget.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    /////////api
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("User has logged in");
    }

    ////////////////////UI
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: AppColors.mainBlackColor,
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          //profile pic section

                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height30 + Dimensions.height45,
                            size: Dimensions.height15 * 10,
                          ),
                          SizedBox(height: Dimensions.height30),

                          ///
                          //profilebody

                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //name
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height45,
                                      size: Dimensions.height15 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel.name,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height45,
                                      size: Dimensions.height15 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel.phone,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height45,
                                      size: Dimensions.height15 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel.email,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height45,
                                      size: Dimensions.height15 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "thekkekara (H)",
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //message
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height45,
                                      size: Dimensions.height15 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "Safad",
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  //logout
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout_outlined,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.height45,
                                        size: Dimensions.height15 * 5,
                                      ),
                                      bigText: BigText(
                                        text: "Logout",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CustomLoader())
              : SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 8,
                          margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.raduis20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/signintocontinue.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.raduis20),
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign in",
                                color: Colors.white,
                                size: Dimensions.font20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
