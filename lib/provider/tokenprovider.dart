import 'package:ecommerce_app/model/tokenModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider with ChangeNotifier {
  Future<bool> saveUser(TokenModel tokenModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', tokenModel.token.toString());
    notifyListeners();
    return true;
  }

  Future<TokenModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tokens = prefs.getString('token');
    return TokenModel(token: tokens.toString());
  }

//   void remove()async{
//         SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.clear();
//   }

//or

  Future<bool> remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    return true;
  }
}
