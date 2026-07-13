import 'package:alnikah/app/services/storage_service.dart';
import 'package:get/instance_manager.dart';

class DependecyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
}
