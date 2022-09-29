// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({
    required this.sharedPreferences,
  });

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];

/* 
convert objects to string becuase sharedpreferences only accepts string 
 */

    cartList.forEach(
      (element) => cart.add(jsonEncode(element)),
    );

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);

    //   print(sharedPreferences.getStringList("Cart-list"));
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }

    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }
}
