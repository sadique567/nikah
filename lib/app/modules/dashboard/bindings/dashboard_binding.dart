import 'package:alnikah/app/modules/profile_screen/controllers/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
    Get.put<ProfileScreenController>(ProfileScreenController());
  }
}
