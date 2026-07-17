import 'package:get/get.dart';

import '../controllers/edit_user_details_controller.dart';

class EditUserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditUserDetailsController>(EditUserDetailsController());
  }
}
