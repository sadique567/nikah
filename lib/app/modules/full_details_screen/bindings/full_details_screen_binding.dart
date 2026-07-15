import 'package:get/get.dart';

import '../controllers/full_details_screen_controller.dart';

class FullDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FullDetailsScreenController>(FullDetailsScreenController());
  }
}
