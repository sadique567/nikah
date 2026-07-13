import 'package:alnikah/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    });
  }
}
