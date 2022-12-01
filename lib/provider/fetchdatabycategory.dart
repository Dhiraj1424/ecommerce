import 'package:ecommerce_app/model/products.dart';
import 'package:ecommerce_app/services/apiservice.dart';
import 'package:flutter/cupertino.dart';

class FetchDataByCategoryProvider with ChangeNotifier{
List<ProductModel>myDataList=[];
bool loading=false;

Future getDataByCategory(String catName)async{
loading=true;

myDataList=await ApiService().getProductByCategory(catName);
loading=false;
ChangeNotifier();

}






}