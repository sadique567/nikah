import 'package:alnikah/app/routes/app_pages.dart';
import 'package:alnikah/app/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  RxBool obscurePassword = true.obs;
  RxBool isLoading = false.obs;

  void togglePassword() {
    obscurePassword.toggle();
  }

  void login() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      snackbartCustom();
      Get.offAllNamed(Routes.DASHBOARD);
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
