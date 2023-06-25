import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Flutter Package to display toast
void showToast(){
    Fluttertoast.showToast(
      msg: "Copied",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0
  );
}