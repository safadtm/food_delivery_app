// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });

  List<ProductModel> _recommendedProductList = [];

  List<ProductModel> get recommendedProductList => _recommendedProductList = [];

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      //  print("got recommended product");

      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);

      //  print(_recommendedProductList);
      _isLoaded = true;
      update();
    } else {
      // print("could not got recomended product");
    }
    update();
  }
}
