import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();

  RxString gender = "".obs;
  RxString qualification = "".obs;

  RxBool isLoading = false.obs;

  final genderList = [
    "Male",
    "Female",
    "Other",
  ];

  final qualificationList = [
    "10th",
    "12th",
    "Diploma",
    "Graduate",
    "Post Graduate",
    "PhD",
  ];

  Future<void> selectDOB(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
    );

    if (picked != null) {
      dobController.text =
          "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  void register() async {
    if (!formKey.currentState!.validate()) return;

    if (gender.value.isEmpty) {
      Get.snackbar("Error", "Please select gender");
      return;
    }

    if (qualification.value.isEmpty) {
      Get.snackbar("Error", "Please select qualification");
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

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
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.onClose();
  }
}