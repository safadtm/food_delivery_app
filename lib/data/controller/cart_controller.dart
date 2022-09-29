// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/data/repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({
    required this.cartRepo,
  });

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  //for local storage and sharedpreferences
  List<CartModel> storageItems = [];

  //additem

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;

    if (_items.containsKey(product.id!)) {
      _items.update(
        product.id!,
        (value) {
          totalQuantity = value.quantity! + quantity;

          return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product,
          );
        },
      );

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      } else {
        Get.snackbar(
          'Item count',
          "You should at least add an item in the cart !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(getItems);

    update();
  }

  //existInCart

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  //getQuantity

  int getQuantity(ProductModel product) {
    var quantity = 0;

    if (_items.containsKey(product.id)) {
      _items.forEach(
        (key, value) {
          if (key == product.id) {
            quantity = value.quantity!;
          }
        },
      );
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });

    return totalQuantity;
  }

  ///Cart Page thing
  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  ///total amount
  int get totalAmount {
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });

    return total;
  }

  //local storage
  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();

    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;

    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(
        storageItems[i].product!.id!,
        () => storageItems[i],
      );
    }
  }
}
