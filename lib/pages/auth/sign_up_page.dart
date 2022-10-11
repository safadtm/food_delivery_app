import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/show_snackbar.dart';
import 'package:food_delivery_app/models/signup_body.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    ///validation
    void _registration() {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
        showSnackBar("Type in your email address", title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showSnackBar(
          "Type in a valid email address",
          title: "Valid email address",
        );
      } else if (password.isEmpty) {
        showSnackBar("Type in your password", title: "Password");
      } else if (password.length < 8) {
        showSnackBar("Password can not be less than eight characters",
            title: "Password");
      } else {
        showSnackBar("All went well", title: "Perfect");

        SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.05),
            //top icon
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
            //
            //email
            AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(height: Dimensions.height20),
            //password
            AppTextField(
              textController: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp,
            ),
            SizedBox(height: Dimensions.height20),
            //name
            AppTextField(
              textController: nameController,
              hintText: "Name",
              icon: Icons.person,
            ),
            SizedBox(height: Dimensions.height20),
            //phone
            AppTextField(
              textController: phoneController,
              hintText: "Phone",
              icon: Icons.phone,
            ),
            SizedBox(height: Dimensions.height20),
            //signupbutton
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.raduis30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Sign up",
                    size: Dimensions.font20 + Dimensions.font20 / 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //
            SizedBox(height: Dimensions.height10),
            //tagline
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
              ),
            ),
            //social media connection
            SizedBox(height: Dimensions.screenHeight * 0.05),
            RichText(
              text: TextSpan(
                text: "Sign up using one of the following methods",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font16,
                ),
              ),
            ),
            Wrap(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.raduis30,
                    backgroundImage:
                        AssetImage("assets/images/${signUpImages[index]}"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
