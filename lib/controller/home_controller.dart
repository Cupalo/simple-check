import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple/api/api.dart';
import 'package:simple/model/data.dart';

class HomeController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var staffId = TextEditingController();
  var staffName = TextEditingController();
  var staffHobby = TextEditingController();
  var staffPassword = TextEditingController();
  var staffPassword2 = TextEditingController();

  bool isFilled() {
    return staffId.text.isNotEmpty &&
        staffName.text.isNotEmpty &&
        staffHobby.text.isNotEmpty &&
        staffPassword.text.isNotEmpty &&
        staffPassword2.text.isNotEmpty;
  }

  bool isValidPassword() {
    return staffPassword.text == staffPassword2.text;
  }

  postStaff() async {
    var res = await BaseApi.postStaf(
      DataStaff(
        staffId: staffId.text,
        staffName: staffName.text,
        staffHobby: staffHobby.text,
        staffPassword: staffPassword.text,
        staffPassword2: staffPassword2.text,
      ),
    );
    if (res?.data != null) {
      DataStaff dataStaff = DataStaff.fromJson(res?.data);
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Welcome ${dataStaff.staffName}',
        onConfirm: Get.back,
      );
    } else {
      Get.defaultDialog(
        title: 'Failed',
        middleText: 'Try Again',
        onConfirm: Get.back,
      );
    }
  }

  submit() {
    formKey.currentState?.validate();
    if (isFilled()) {
      if (isValidPassword()) {
        postStaff();
      } else {
        Get.defaultDialog(
          title: 'Failed',
          middleText: 'Invalid Password',
          onConfirm: Get.back,
        );
      }
    }
  }
}
