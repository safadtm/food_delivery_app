import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.raduis20),
                    topRight: Radius.circular(Dimensions.raduis20),
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.height10 / 2,
                  bottom: Dimensions.height10,
                ),
                child: Center(
                  child: BigText(
                    text: 'Sliver app bar',
                    color: Colors.black,
                    size: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://c1.wallpaperflare.com/preview/512/284/992/fried-rice-menu-for.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(
                    text:
                        "Lorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elitLorem ipsum dolor sit amet consectetur adipiscing elit",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //----------

          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "\$12.88 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),

          //----------
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),

                //-----

                Container(
                  child:
                      BigText(text: "\$10 | Add to cart", color: Colors.white),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
