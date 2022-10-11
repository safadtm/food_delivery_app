import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/controller/auth_controller.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    print("Iam printing loading state " +
        Get.find<AuthController>().isLoading.toString());

    return Center(
      child: Container(
        height: Dimensions.height10 * 10,
        width: Dimensions.width10 * 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height20 * 5 / 2),
          color: AppColors.mainColor,
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
