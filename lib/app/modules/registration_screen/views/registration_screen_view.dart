import 'package:alnikah/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/registration_screen_controller.dart';

class RegistrationScreenView extends GetView<RegistrationScreenController> {
  RegistrationScreenView({super.key});

  InputDecoration inputDecoration({
    required String hint,
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      label: Text(label),
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      suffixIcon: suffixIcon,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  final double sizedBoxHeight = 10;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Registration"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: sizedBoxHeight),

                  const Icon(
                    Icons.person_add_alt_1,
                    size: 80,
                    color: Colors.blue,
                  ),

                  SizedBox(height: sizedBoxHeight),

                  const Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: sizedBoxHeight),

                  Text(
                    "Fill all required details",
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: sizedBoxHeight),

                  /// Full Name
                  TextFormField(
                    controller: controller.fullNameController,
                    decoration: inputDecoration(
                      hint: "Full Name",
                      label: "Full Name",
                      icon: Icons.person_outline,
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Enter Full Name" : null,
                  ),

                  SizedBox(height: sizedBoxHeight),

                  // /// Email
                  // TextFormField(
                  //   controller: controller.emailController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: inputDecoration(
                  //     hint: "Email",
                  //     label: "Email",
                  //     icon: Icons.email_outlined,
                  //   ),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "Enter Email";
                  //     }
                  //     if (!GetUtils.isEmail(value)) {
                  //       return "Enter Valid Email";
                  //     }
                  //     return null;
                  //   },
                  // ),

                  //  SizedBox(height: sizedBoxHeight),

                  /// Phone
                  TextFormField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.text,
                    // maxLength: 10,
                    decoration: inputDecoration(
                      hint: "Email/Phone",
                      label: "Email/Phone",
                      icon: Icons.account_balance,
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return "Enter Valid Email/Phone";
                      }

                      if (!GetUtils.isEmail(value) &&
                          !GetUtils.isPhoneNumber(value)) {
                        return "Enter Valid Email/Phone";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: sizedBoxHeight),
                  // Password Field
                  Obx(
                    () => TextFormField(
                      controller: controller.password,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isPasswordHidden.value,
                      decoration: inputDecoration(
                        hint: "Password",
                        label: "Password",
                        icon: Icons.lock,

                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            controller.isPasswordHidden.toggle();
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter Password";
                        }

                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }

                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: sizedBoxHeight),

                  // Confirm Password Field
                  Obx(
                    () => TextFormField(
                      controller: controller.confirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isConfirmPasswordHidden.value,

                      decoration: inputDecoration(
                        hint: "Confirm Password",
                        label: "Confirm Password",
                        icon: Icons.lock,

                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isConfirmPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            controller.isConfirmPasswordHidden.toggle();
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter Confirm Password";
                        }

                        if (value != controller.password.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: sizedBoxHeight),

                  /// Button
                  Obx(
                    () => SizedBox(
                      height: sizedBoxHeight + 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.isLoading.value) {
                            return;
                          }
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          controller.register();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Register?"),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN_SCREEN);
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                  SizedBox(height: sizedBoxHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
