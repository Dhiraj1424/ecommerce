import 'package:ecommerce_app/model/tokenModel.dart';
import 'package:ecommerce_app/provider/tokenprovider.dart';
import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/screens/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashService{

Future<TokenModel> getUserData()=>TokenProvider().getUser();
void authentication(BuildContext context)async{
getUserData().then((value) {
if(value.token==null || value.token==''){
Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));

}
else{
  Navigator.push(context, MaterialPageRoute(builder: ((context) => NavBar())));

}


}).onError((error, stackTrace) => null);
  
}


}