import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chat_app_learning/models/user_model.dart';
import 'package:flutter_chat_app_learning/screens/verfication_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppFirebase {
  Future<void> sendVerificationCode(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) {
          printInfo(info: "user verified");
        },
        verificationFailed: (FirebaseAuthException e) {
          printError(info: e.message!);
        },
        codeSent: (String verificationId, int? resendToken) async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString("code", verificationId);
          Get.to(const VerificationScreen());
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> verifyOTP(String otp) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? verificationId = pref.getString("code");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> createUser(UserModel userModel) async {
    CollectionReference ref = FirebaseFirestore.instance.collection("users");
    await FirebaseAuth.instance.currentUser?.updateDisplayName(userModel.name);
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(userModel.image);
    SharedPreferences.getInstance().then((value) {
      value.setString("number", userModel.number);
    });

    return await ref.doc(userModel.uId).set(userModel.toJson());
  }

  Future<String> uploadUserImage(String path, String uId, File file) async {
    Reference storage = FirebaseStorage.instance.ref(uId).child(path);
    UploadTask task = storage.putFile(file);
    TaskSnapshot snapshot = await task;
    String link = await snapshot.ref.getDownloadURL();
    return link;
  }
}
