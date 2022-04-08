import 'package:flutter/material.dart';
import 'package:flutter_chat_app_learning/controllers/login_controller.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerificationScreen extends GetView<LoginController> {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
          isLoading: controller.isLoading.value,
          progressIndicator: SpinKitRotatingPlain(
            color: Theme.of(context).primaryColor,
          ),
          child: Scaffold(
            body: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: Container(
                      height: AppBar().preferredSize.height,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              width: AppBar().preferredSize.height - 8,
                              height: AppBar().preferredSize.height - 8,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  borderRadius: BorderRadius.circular(32),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                              child: Text(
                            "OTP Verfication",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: Image.asset(
                              "assets/images/verification.jpg",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Enter OTP that we sent to you",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 40),
                          child: PinInputTextField(
                            controller: controller.otpController,
                            pinLength: 6,
                            textInputAction: TextInputAction.done,
                            decoration: CirclePinDecoration(
                                strokeColorBuilder: FixedColorBuilder(
                                    Theme.of(context).primaryColor),
                                hintText: "345678",
                                errorText: controller.pinError.value.isEmpty
                                    ? null
                                    : controller.pinError.value,
                                strokeWidth: 2,
                                hintTextStyle: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: 30,
                            top: 40,
                          ),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(4, 4),
                                  blurRadius: 10,
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.1),
                                )
                              ],
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  controller.verifyOTP();
                                },
                                borderRadius: BorderRadius.circular(30),
                                child: const Center(
                                  child: Text(
                                    "Verify OTP",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
