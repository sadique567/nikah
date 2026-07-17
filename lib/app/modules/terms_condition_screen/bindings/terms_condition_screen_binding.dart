import 'package:get/get.dart';

import '../controllers/terms_condition_screen_controller.dart';

class TermsConditionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TermsConditionScreenController>(TermsConditionScreenController());
  }
}
