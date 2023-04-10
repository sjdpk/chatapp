import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class AppLog {
  // Blue text
  static void info(String msg) {
    if (kDebugMode) developer.log('\x1B[34m$msg\x1B[0m');
  }

  // Green text
  static void success(String msg) {
    if (kDebugMode) developer.log('\x1B[32m$msg\x1B[0m');
  }

  // Yellow text
  static void warning(String msg) {
    if (kDebugMode) developer.log('\x1B[33m$msg\x1B[0m');
  }

  // Red text
  static void error(String msg) {
    if (kDebugMode) developer.log('\x1B[31m$msg\x1B[0m');
  }
}
