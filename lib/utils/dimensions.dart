import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;
  static double pageView = screenHeight / 2.64;

//dynnamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

//dynnamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;

//dynnamic fontsize

  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

//dynnamic border raduis
  static double raduis15 = screenHeight / 56.27;
  static double raduis20 = screenHeight / 42.2;
  static double raduis30 = screenHeight / 28.13;

//Icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

//List view size
  static double listviewImgSize = screenWidth / 3.25;
  static double listviewTextContainerSize = screenWidth / 3.9;

//popular food
  static double popularFoodImgSize = screenHeight / 2.41;

//bottom height
  static double bottomHeightBar = screenHeight / 7.03;

//splash screen dimensions
  static double splashImg = screenHeight / 3.8;
}
