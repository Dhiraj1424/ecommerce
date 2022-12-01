import 'package:ecommerce_app/services/apiservice.dart';
import 'package:flutter/material.dart';

import '../model/products.dart';

class SingleData with ChangeNotifier{

List<ProductModel> singleproductList=[];
bool isLoading= false;
// late  int id;
Future getSingleProduct(int id)async{
  isLoading=true;
  singleproductList=await ApiService().getSingleProduct(id);
  isLoading=false;
  notifyListeners();
}


}