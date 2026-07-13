import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/registration_screen_controller.dart';

class RegistrationScreenView extends GetView<RegistrationScreenController> {
  const RegistrationScreenView({super.key});

  InputDecoration inputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      label: Text(label),
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),

                const Icon(
                  Icons.person_add_alt_1,
                  size: 80,
                  color: Colors.blue,
                ),

                const SizedBox(height: 15),

                const Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  "Fill all required details",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600),
                ),

                const SizedBox(height: 30),

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

                const SizedBox(height: 16),

                /// Email
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration(
                    hint: "Email",
                    label: "Email",
                    icon: Icons.email_outlined,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// Phone
                TextFormField(
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: inputDecoration(
                    hint: "Phone Number",
                    label: "Phone Number",
                    icon: Icons.phone_outlined,
                  ),
                  validator: (value) {
                    if (value!.length != 10) {
                      return "Enter Valid Phone Number";
                    }
                    return null;
                  },
                ),

                /// DOB
                TextFormField(
                  controller: controller.dobController,
                  readOnly: true,
                  onTap: () => controller.selectDOB(context),
                  decoration: inputDecoration(
                    hint: "Date of Birth",
                    label: "Date of Birth",
                    icon: Icons.calendar_today_outlined,
                  ).copyWith(suffixIcon: const Icon(Icons.date_range)),
                  validator: (value) => value!.isEmpty ? "Select DOB" : null,
                ),

                const SizedBox(height: 16),

                /// Gender
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.gender.value.isEmpty
                        ? null
                        : controller.gender.value,
                    decoration: inputDecoration(
                      hint: "Gender",
                      label: "Gender",
                      icon: Icons.people_outline,
                    ),
                    items: controller.genderList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                ),

                const SizedBox(height: 16),

                /// Qualification
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.qualification.value.isEmpty
                        ? null
                        : controller.qualification.value,
                    decoration: inputDecoration(
                      hint: "Qualification",
                      label: "Qualification",
                      icon: Icons.school_outlined,
                    ),
                    items: controller.qualificationList
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      controller.qualification.value = value!;
                    },
                  ),
                ),

                const SizedBox(height: 16),

                /// Address
                TextFormField(
                  controller: controller.addressController,
                  maxLines: 4,
                  decoration: inputDecoration(
                    hint: "Address",
                    label: "Address",
                    icon: Icons.location_on_outlined,
                  ),
                  validator: (value) => value!.isEmpty ? "Enter Address" : null,
                ),

                const SizedBox(height: 30),

                /// Button
                Obx(
                  () => SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.register,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
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

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
