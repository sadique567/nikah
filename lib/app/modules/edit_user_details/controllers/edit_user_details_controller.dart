import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserDetailsController extends GetxController {


  // ---------- Basic Details ----------
  final nameCtrl = TextEditingController();
  final RxString gender = 'Male'.obs;
  final Rx<DateTime?> dob = Rx<DateTime?>(null);
  final RxString maritalStatus = 'Single'.obs;
  final heightCtrl = TextEditingController();
  final weightCtrl = TextEditingController();

  // ---------- Contact / Address ----------
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final RxString state = 'Delhi'.obs;
  final RxString country = 'India'.obs;

  // ---------- Religious Details ----------
  final RxString religion = 'Hindu'.obs;
  final casteCtrl = TextEditingController();
  final subCasteCtrl = TextEditingController();
  final gothraCtrl = TextEditingController();
  final RxString manglik = 'No'.obs;

  // ---------- Education & Career ----------
  final RxString education = 'Graduate'.obs;
  final occupationCtrl = TextEditingController();
  final companyCtrl = TextEditingController();
  final RxString income = '5-10 LPA'.obs;

  // ---------- Family Details ----------
  final fatherNameCtrl = TextEditingController();
  final motherNameCtrl = TextEditingController();
  final RxString familyType = 'Nuclear'.obs;
  final siblingsCtrl = TextEditingController();

  // ---------- Lifestyle ----------
  final RxString diet = 'Vegetarian'.obs;
  final RxString smoking = 'No'.obs;
  final RxString drinking = 'No'.obs;
  final hobbiesCtrl = TextEditingController();

  // ---------- About ----------
  final aboutCtrl = TextEditingController();

  final RxBool isLoading = false.obs;

  // Dropdown option lists
  final genderOptions = ['Male', 'Female', 'Other'];
  final maritalOptions = ['Single', 'Divorced', 'Widowed'];
  final stateOptions = ['Delhi', 'Maharashtra', 'Karnataka', 'Uttar Pradesh', 'Punjab'];
  final countryOptions = ['India', 'USA', 'UK', 'Canada', 'Australia'];
  final religionOptions = ['Hindu', 'Muslim', 'Sikh', 'Christian', 'Jain', 'Other'];
  final manglikOptions = ['Yes', 'No', "Don't Know"];
  final educationOptions = ['High School', 'Graduate', 'Post Graduate', 'Doctorate'];
  final incomeOptions = ['Below 5 LPA', '5-10 LPA', '10-20 LPA', '20+ LPA'];
  final familyTypeOptions = ['Nuclear', 'Joint'];
  final dietOptions = ['Vegetarian', 'Non-Vegetarian', 'Vegan', 'Eggetarian'];
  final yesNoOptions = ['Yes', 'No'];


// Replace RxString fields used for dropdowns with ValueNotifier:
final genderNotifier = ValueNotifier<String?>('Male');
final maritalStatusNotifier = ValueNotifier<String?>('Single');
final stateNotifier = ValueNotifier<String?>('Delhi');
final countryNotifier = ValueNotifier<String?>('India');
final religionNotifier = ValueNotifier<String?>('Hindu');
final educationNotifier = ValueNotifier<String?>('Graduate');
final incomeNotifier = ValueNotifier<String?>('5-10 LPA');
final dietNotifier = ValueNotifier<String?>('Vegetarian');



// ---------------------------------------------------
  Future<void> pickDob(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) dob.value = picked;
  }

  Future<void> saveDetails() async {
   

    isLoading.value = true;
    try {
      // TODO: call your API / repository here
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar('Success', 'Profile updated successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    heightCtrl.dispose();
    weightCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    cityCtrl.dispose();
    casteCtrl.dispose();
    subCasteCtrl.dispose();
    gothraCtrl.dispose();
    occupationCtrl.dispose();
    companyCtrl.dispose();
    fatherNameCtrl.dispose();
    motherNameCtrl.dispose();
    siblingsCtrl.dispose();
    hobbiesCtrl.dispose();
    aboutCtrl.dispose();
    super.onClose();
  }
}