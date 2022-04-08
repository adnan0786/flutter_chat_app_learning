import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_learning/controllers/login_controller.dart';
import 'package:flutter_chat_app_learning/screens/verfication_screen.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';

class NumberScreen extends GetView<LoginController> {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).disabledColor.withOpacity(0.1),
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                ], color: Theme.of(context).backgroundColor),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        width: AppBar().preferredSize.height - 8,
                        height: AppBar().preferredSize.height - 8,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
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
                        "Registration",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: Image.asset("assets/images/otp.jpg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      "We will send you one time OTP on this number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.1),
                                  offset: const Offset(4, 4),
                                  blurRadius: 10,
                                )
                              ]),
                          child: CountryCodePicker(
                            initialSelection: 'PK',
                            favorite: const ['+92', 'PK'],
                            closeIcon: Icon(
                              Icons.close,
                              color: Theme.of(context).primaryColor,
                            ),
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            onChanged: (countryCode) {
                              if (kDebugMode) {
                                print(countryCode.dialCode);
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .disabledColor
                                        .withOpacity(0.1),
                                    offset: const Offset(4, 4),
                                    blurRadius: 10,
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              child: SizedBox(
                                height: 48,
                                child: Center(
                                  child: Obx(() => TextField(
                                        controller: controller.numberController,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                          errorMaxLines: 1,
                                          contentPadding: const EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                          ),
                                          errorText: controller
                                                  .numberError.value.isEmpty
                                              ? null
                                              : controller.numberError.value,
                                          border: InputBorder.none,
                                          hintText: "Number",
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 40,
                    ),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.1),
                              offset: const Offset(4, 4),
                              blurRadius: 10,
                            )
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            controller.sendOTP();
                            // Get.to(const VerificationScreen());
                          },
                          borderRadius: BorderRadius.circular(30),
                          child: const Center(
                            child: Text(
                              "Generate OTP",
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
    );
  }
}
