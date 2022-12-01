import 'package:badges/badges.dart';
import 'package:ecommerce_app/model/cartmodel.dart';
import 'package:ecommerce_app/provider/cartprovider.dart';
import 'package:ecommerce_app/screens/cartpage.dart';
import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/services/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce_app/model/products.dart';
import 'package:ecommerce_app/provider/singleProduct.dart';
import 'package:ecommerce_app/provider/singledata.dart';

import '../model/products.dart';
import '../provider/fetchdata.dart';

class ProductDetail extends StatelessWidget {
   ProductDetail({
    Key? key,
    this.id,
    required this.prodDetail,
  }) : super(key: key);
  final int? id;
  final ProductModel prodDetail;
  @override
//   void initState() {
//     // TODO: implement initState

//     final singleProduct=Provider.of<FretchProductProvider>(context, listen: false);
//     singleProduct.getProduct();
// super.initState();
//   }
DBHelper dbHelper=DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
//final getProducts=Provider.of<FretchProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return CartScreen();
            })));
          }, icon: Badge(
            shape: BadgeShape.square,
            badgeContent: Text('3'),
            badgeColor: Colors.green,
            animationType: BadgeAnimationType.slide	,
            child: Icon(
              Icons.shopping_cart),
          ))
        ],
      ),
// body:singleProduct.isLoading?Center(
//   child: CircularProgressIndicator(),
// ):ListView.builder(
//   //itemCount: singleProduct.productList.length.,
//   itemBuilder: ((context, index) {
//   return Card(
//     child: Text(
//       singleProduct.productList[index].id.toString()
//     ),
//   );
// }))
      body: Container(
        margin: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10
        ),
        child: Column(
          
          children: [
            
            Flexible(
              flex: 1,
              child: Text('${prodDetail.category}',

              style: TextStyle(fontWeight: FontWeight.w800),
              )),

            const  Flexible(
                flex: 1,
                child: SizedBox(
              height: 10,
              )),
            Flexible(
                flex: 1,
              child: Text('${prodDetail.title}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              )),
              const  Flexible(
                flex: 1,
                child: SizedBox(
              height: 10,
              )),
            Flexible(
                flex:8,
              child: Image.network('${prodDetail.image}')),
              const  Flexible(
                flex: 1,
                child: SizedBox(
              height: 10,
              )),
 Flexible(
  flex: 2,
  child: Text('${prodDetail.description}', 
  textAlign: TextAlign.justify,
  style: const TextStyle(
fontSize: 18,


  ),)),
  const  Flexible(
                flex: 1,
                child: SizedBox(
              height: 10,
              )),
            Flexible(
              
                flex: 1,
              child: Text('Rs.'+'${prodDetail.price}',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20
              ),
              )),
              const  Flexible(
                flex: 1,
                child: SizedBox(
              height: 10,
              )),
                 SummitButton(ontap: (){
dbHelper.insert(
  Cart(id: id,
   productId: prodDetail.description,
    productName: prodDetail.title, 
    initialPrice: prodDetail.price!.toInt() ,
    productPrice: prodDetail.price!.toInt(),
     quantity: 1,  image: prodDetail.image)
).then((value){

                                        // cart.addTotalPrice(double.parse(prodDetail.price.);
                                        cart.addCounter();});
                 }, text: 'Add to Cart')    

            ],
            
        ),
      ),
    );
  }


}

