import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

Widget mybackButton({Color? color}) {
  return IconButton(
    onPressed: () {
      Get.back();
    },
    icon: Icon(CupertinoIcons.back, color: color),
  );
}

void snackbartCustom({
  bool isTrue = true,
  bool position = true,
  String? title,
  String? subtitle,
}) {
  Get.snackbar(
    title ?? (isTrue ? "Success" : "Error"),
    subtitle ?? (isTrue ? "Login Successfully" : "Something went wrong"),
    snackPosition: position ? SnackPosition.TOP : SnackPosition.BOTTOM,
    backgroundColor: isTrue ? Colors.green : Colors.red,
    colorText: Colors.white,
  );
}
