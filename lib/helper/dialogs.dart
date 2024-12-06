
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs{
  static void info(String m){
    Get.snackbar("Info ",m,backgroundColor: Colors.blue);
  }
}