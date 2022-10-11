// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery_app/models/signup_body.dart';
import 'package:get/get.dart';

import 'package:food_delivery_app/data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(SignUpBody signUpBody) {
    _isLoading = true;
  }
}
