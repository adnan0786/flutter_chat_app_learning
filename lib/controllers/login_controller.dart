import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app_learning/network/app_firebase.dart';
import 'package:flutter_chat_app_learning/screens/get_user_data_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String code = "+92";
  RxString numberError = RxString("");
  RxString pinError = RxString("");
  FirebaseAuth auth = FirebaseAuth.instance;
  AppFirebase appFirebase = AppFirebase();
  late String number;
  RxBool isLoading = RxBool(false);

  @override
  void onClose() {
    super.onClose();
    numberController.dispose();
    otpController.dispose();
  }

  void sendOTP() async {
    if (numberController.text.isEmpty) {
      numberError("Field is required");
    } else if (numberController.text.length < 10) {
      numberError.value = "Invalid Number";
    } else {
      numberError("");
      number = code + numberController.text;
      await appFirebase.sendVerificationCode(number);
    }
  }

  void verifyOTP() async {
    if (otpController.text.isEmpty) {
      pinError.value = "Field is required";
    } else if (otpController.text.length < 6) {
      pinError.value = "Invalid Pin";
    } else {
      isLoading.value = true;
      await appFirebase.verifyOTP(otpController.text);
      isLoading.value = false;
      Get.off(const UserDataScreen());
    }
  }
}
