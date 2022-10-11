import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/controller/cart_controller.dart';
import 'package:food_delivery_app/data/controller/popular_product_controller.dart';
import 'package:food_delivery_app/data/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //local storage calling
    Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: const SignInPage(),
              // initialRoute: RouteHelper.getSplashScreen(),
              getPages: RouteHelper.routes,
            );
          },
        );
      },
    );
  }
}
