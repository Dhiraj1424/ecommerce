import 'package:flutter/material.dart';

import '../model/singleProduct.dart';
import '../services/apiservice.dart';

class SingleProductProvider with ChangeNotifier {
  SingleProduct? post = SingleProduct();
  bool isLoading = false;

Future  getSingleProductData(int id) async {
    isLoading = true;
    post = await ApiService().getSingle(id);
    isLoading = false;

    notifyListeners();
  }
}