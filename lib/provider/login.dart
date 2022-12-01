// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginProvider with ChangeNotifier{
// bool isloading=false;

// void isLogin()async{
//   isloading=true;
//   SharedPreferences sd=await SharedPreferences.getInstance();
//  var token=  sd.getString('token');

//    if (token != null) {
//     //   Navigator.of(context)
//     //       .pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
//     // }
// }
// // 

// }

//import 'dart:ffi';

import 'package:ecommerce_app/model/tokenModel.dart';
import 'package:ecommerce_app/provider/tokenprovider.dart';
import 'package:ecommerce_app/screens/navbar.dart';
import 'package:ecommerce_app/services/apiservice.dart';
import 'package:ecommerce_app/utils/function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier{
final _repo=ApiService();

//  login( dynamic data,d, BuildContext context)async{
//   // _repo.loginUser(data).then((value) {}).onError((error, stackTrace) => null)

//   _repo.loginUser(data, d).then((value) {




//   }).onError((error, stackTrace) {
//     print('error');
//   });
   
// }


Future login(String username ,String password,BuildContext context)async{
  _repo.loginUser(username, password).then((value) {

    final pers=Provider.of<TokenProvider>(context,listen: false);
    pers.saveUser(
      TokenModel(
        token: value
      )
    );
    FunctionName.toastMessage('Login Sucessful');
    Navigator.push(context, MaterialPageRoute(builder: ((context) => NavBar())));
    notifyListeners();
  }).onError((error, stackTrace) {

    FunctionName.toastMessage('my error'+error.toString());
    notifyListeners();

  });
}
}