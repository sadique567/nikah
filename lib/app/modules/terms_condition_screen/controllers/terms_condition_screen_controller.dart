import 'package:alnikah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditionScreenController extends GetxController {
  final RxBool isAgreed = false.obs;
  final RxBool isLoading = false.obs;

  void toggleAgreement(bool? value) {
    isAgreed.value = value ?? false;
  }

  Future<void> acceptAndContinue() async {
    if (!isAgreed.value) {
      Get.snackbar(
        "Action Required",
        "Please accept the Terms & Conditions to continue",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(14),
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 600));
    isLoading.value = false;
    Get.offAllNamed(Routes.LOGIN_SCREEN);
  }

  @override
  void onClose() {
    super.onClose();
  }



}
