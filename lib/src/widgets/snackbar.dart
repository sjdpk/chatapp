import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

displaySnackBar(
  String message, {
  Toast? toastLength,
  double? fontSize,
  ToastGravity? gravity,
  Color? backgroundColor,
  Color? textColor,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength ?? Toast.LENGTH_SHORT,
    gravity: gravity ?? ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor ?? Colors.red,
    textColor: textColor ?? Colors.white,
    fontSize: fontSize ?? 16.0,
  );
}
