// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({
    required this.popularProductRepo,
  });

  List<ProductModel> _popularProductList = [];

  List<ProductModel> get popularProductList => _popularProductList = [];

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got popular product");

      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("could not got popular product");
    }
  }
}
