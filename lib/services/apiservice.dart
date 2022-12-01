import 'dart:convert';

import 'package:ecommerce_app/model/cartmodel.dart';
import 'package:ecommerce_app/model/products.dart';
import 'package:ecommerce_app/utils/function.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/singleProduct.dart';

class ApiService {
static const Map<String, String> defaultHeader={
'Accept':"application/json"
};
  Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var map = {
      "Accept": "application/json",
      "Authorization": "${sharedPreferences.getString("token")}"
    };
    print("User token is: ${sharedPreferences.getString("token")}");
    return map;
  }


  Future<List<ProductModel>> allProduct() async {
    List<ProductModel> product = [];
    ProductModel productModel;
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final data = await json.decode(response.body);
        for (var i in data) {
          productModel = ProductModel.fromJson(i);
          product.add(productModel);
        }
        return product;
      } else {
        print("Something is wrong");
        return product;
      }
    } catch (e) {
      print('here comes error ' + e.toString());
    }
    return product;
  }

  Future<List<ProductModel>> getSingleProduct(int id) async {
    // ProductModel result;
    List<ProductModel> result = [];
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        for (var i in data) {
          ProductModel productModel = ProductModel.fromJson(i);
          result.add(productModel);
        }
        //result = ProductModel.fromJson(data);
      } else {
        print('something went wrong');
      }
    } catch (e) {
      throw e.toString();
    }
    return result;
  }

  Future<SingleProduct?> getSingle(int id) async {
    SingleProduct? result;

    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = SingleProduct.fromJson(item);
        return result;
      } else {
        print('object');
      }
    } catch (e) {
      throw e.toString();
    }
    return result;
  }

  Future getCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    return json.decode(response.body);
  }

  Future<List<ProductModel>> getProductByCategory(String catName) async {

     ProductModel productModel;
    final List<ProductModel> productCategoryList =[];
    final respone = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$catName'));

try{
if(respone.statusCode==200){
  final cat=json.decode(respone.body);
for(var i in cat){
  productModel=ProductModel.fromJson(i);
  productCategoryList.add(productModel);
}
return productCategoryList;
}
else{
  print('object');
}
}
catch(e){
  throw e.toString();
}

return productCategoryList;
  }

Future<String> loginUser(String username,String password)async{

var response= await http.post(Uri.parse("https://fakestoreapi.com/auth/login"),
//headers: defaultHeader,
body: {
  'username':username,
  'password':password
}

);

if(response.statusCode==200){
return response.body;
}
return response.body;
}



// Future<List<CartModel>> getAllCart()async{

// List<CartModel> myCart=[];
// final response=await http.get(Uri.parse());
// try{
// if(response.statusCode==200){
// final cart=json.decode(response.body);
// for(var i in cart){
//   CartModel cartModel=CartModel.fromJson(i);
//   myCart.add(cartModel);
// }
// FunctionName.toastMessage()
// }

// }catch(e){
//   throw FunctionName.toastMessage(e.toString());
// }




}

//}
//

