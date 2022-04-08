import 'package:flutter_chat_app_learning/controllers/login_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // here we init our controllers or initial things
    Get.lazyPut(() => LoginController());
  }
}
