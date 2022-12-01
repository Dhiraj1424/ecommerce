import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FunctionName{



static  toastMessage(String msg){
  Fluttertoast.showToast(msg: msg,
  
  backgroundColor: Colors.yellow,
        textColor: Colors.green,
        fontSize: 16.0
  );
}


}