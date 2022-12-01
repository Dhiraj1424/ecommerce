
import 'package:ecommerce_app/model/products.dart';
import 'package:ecommerce_app/services/apiservice.dart';
import 'package:flutter/material.dart';

class FretchProductProvider with ChangeNotifier{
List<ProductModel> productList=[];
bool isLoading= false;

Future getProduct() async{
   isLoading=true;
  productList= await ApiService().allProduct();
  isLoading=false;
  notifyListeners();
}

}