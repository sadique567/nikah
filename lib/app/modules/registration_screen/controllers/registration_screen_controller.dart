import 'package:alnikah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreenController extends GetxController {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;

  RxBool isLoading = false.obs;

  void register() async {
    // if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1), () {
      // Get.offAllNamed(Routes.LOGIN_SCREEN);
      Get.toNamed(Routes.TERMS_CONDITION_SCREEN);
    });

    isLoading.value = false;

    Get.snackbar(
      "Success",
      "Registration Successful",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
