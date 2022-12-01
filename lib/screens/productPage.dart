import 'package:ecommerce_app/provider/fetchdata.dart';
import 'package:ecommerce_app/screens/producrdetail.dart';
//import 'package:ecommerce_app/services/apiservice.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  void initState() {

   final getProducts=Provider.of<FretchProductProvider>(context, listen: false);
getProducts.getProduct();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    final getProducts=Provider.of<FretchProductProvider>(context);
    print('this is a data ${ getProducts.productList.length}');
    return Scaffold(
      appBar: AppBar(),
      body:Container(
        margin: EdgeInsets.only(left: 10,
        top: 5,
        right: 10
        ),
        child: getProducts.isLoading?Center(
          child: CircularProgressIndicator(),
        ):
        GridView.builder(gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
         itemCount: getProducts.productList.length,
         itemBuilder: ((context, index) {
           return Padding(
            padding: EdgeInsets.only(
              bottom: 5
            ),
             child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => 
                ProductDetail(
                  prodDetail: getProducts.productList[index],
                 // id: getProducts.productList[index].id!.toInt()
                  ))));
              },
               child: Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: [
                      Flexible(
                        
                        flex: 4,
                        child: Image.network(getProducts.productList[index].image.toString())),
                     const Flexible (
                        flex: 1,
                        child: SizedBox(
                          height: 20,
                        )),
                      Flexible(
                        flex: 3,
                        child: Text(getProducts.productList[index].title.toString())),
                    const  Flexible (
                        flex: 1,
                        child: SizedBox(
                          height: 20,
                        )),
                      Flexible (
                        flex: 1,
                        child: Row(
                          children: [
                            Text(getProducts.productList[index].price.toString())
                          ],
                        ),
                      )
                    ],
                  ),
                ),
               ),
             ),
           );
         })),
      )
    );
  }
}