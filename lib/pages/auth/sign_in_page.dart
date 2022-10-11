import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_snackbar.dart';
import 'package:food_delivery_app/data/controller/auth_controller.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    ///login
    void _login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (phone.isEmpty) {
        showSnackBar("Type in your email address", title: "Email address");
      } else if (password.isEmpty) {
        showSnackBar("Type in your password", title: "Password");
      } else if (password.length < 8) {
        showSnackBar("Password can not be less than eight characters",
            title: "Password");
      } else {
        authController.login(phone, password).then(
          (status) {
            if (status.isSuccess) {
              print("Success login");
              Get.toNamed(RouteHelper.getInitial());
            } else {
              showSnackBar(status.message);
            }
          },
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    //App Logo
                    SizedBox(
                      height: Dimensions.screenHeight * 0.25,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: Dimensions.raduis20 * 4,
                          backgroundImage:
                              const AssetImage("assets/images/logo part 1.png"),
                        ),
                      ),
                    ),
                    //welcome
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: Dimensions.width20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              fontSize:
                                  Dimensions.font20 * 3 + Dimensions.font20 / 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: Dimensions.height20),
                          Text(
                            "Sign in to your account",
                            style: TextStyle(
                              fontSize: Dimensions.font20,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),

                    //email
                    AppTextField(
                      textController: phoneController,
                      hintText: "Phone number",
                      icon: Icons.phone,
                    ),
                    SizedBox(height: Dimensions.height20),
                    //password
                    AppTextField(
                      isObscure: true,
                      textController: passwordController,
                      hintText: "Password",
                      icon: Icons.password_sharp,
                    ),
                    //tagline
                    SizedBox(height: Dimensions.height20),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        RichText(
                          text: TextSpan(
                            text: "Sign into your account",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                      ],
                    ),

                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    //signInbutton
                    GestureDetector(
                      onTap: () {
                        _login(authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.raduis30),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: "Sign In",
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    //
                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    //tagline
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(
                                    () => const SignUpPage(),
                                    transition: Transition.fade,
                                  ),
                            text: " Create",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
